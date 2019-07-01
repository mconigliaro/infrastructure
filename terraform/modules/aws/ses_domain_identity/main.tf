data "aws_route53_zone" "selected" {
  zone_id = "${var.zone_id}"
}

locals {
  domain = "${replace(data.aws_route53_zone.selected.name, "/.$/", "")}"
}

data "aws_region" "selected" {}

resource "aws_ses_domain_identity" "domain_identity" {
  domain = "${local.domain}"
}

resource "aws_route53_record" "_amazonses" {
  zone_id = "${data.aws_route53_zone.selected.id}"
  name    = "_amazonses.${data.aws_route53_zone.selected.name}"
  type    = "TXT"
  ttl     = "300"
  records = ["${aws_ses_domain_identity.domain_identity.verification_token}"]
}

resource "aws_ses_domain_dkim" "dkim_verification" {
  domain = "${aws_ses_domain_identity.domain_identity.domain}"
}

resource "aws_route53_record" "dkim_verification" {
  count   = 3
  zone_id = "${var.zone_id}"
  name    = "${element(aws_ses_domain_dkim.dkim_verification.dkim_tokens, count.index)}._domainkey.${local.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${element(aws_ses_domain_dkim.dkim_verification.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

resource "aws_ses_domain_mail_from" "mail_from" {
  domain           = "${aws_ses_domain_identity.domain_identity.domain}"
  mail_from_domain = "${var.mail_from_subdomain}.${local.domain}"
}

resource "aws_route53_record" "mail_from_mx" {
  zone_id = "${data.aws_route53_zone.selected.id}"
  name    = "${var.mail_from_subdomain}.${data.aws_route53_zone.selected.name}"
  type    = "MX"
  ttl     = "300"
  records = ["10 feedback-smtp.${data.aws_region.selected.name}.amazonses.com"]
}

resource "aws_route53_record" "mail_from_spf" {
  zone_id = "${data.aws_route53_zone.selected.id}"
  name    = "${var.mail_from_subdomain}.${data.aws_route53_zone.selected.name}"
  type    = "TXT"
  ttl     = "300"
  records = ["v=spf1 include:amazonses.com ~all"]
}
