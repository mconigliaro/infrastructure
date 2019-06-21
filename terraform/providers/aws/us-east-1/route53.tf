resource "aws_route53_zone" "conigliaro_org" {
  name    = "conigliaro.org."
  comment = ""
}

resource "aws_route53_record" "a_conigliaro_org" {
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
  name    = "${aws_route53_zone.conigliaro_org.name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.conigliaro_org.website_domain}"
    zone_id                = "${aws_s3_bucket.conigliaro_org.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "a_www_conigliaro_org" {
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
  name    = "www.${aws_route53_zone.conigliaro_org.name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.www_conigliaro_org.website_domain}"
    zone_id                = "${aws_s3_bucket.www_conigliaro_org.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "a_mail_conigliaro_org" {
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
  name    = "mail.${aws_route53_zone.conigliaro_org.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.mail.public_ip}"]
}

resource "aws_route53_record" "mx_conigliaro_org" {
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
  name    = "${aws_route53_zone.conigliaro_org.name}"
  type    = "MX"
  ttl     = "60"
  records = ["10 mail.${aws_route53_zone.conigliaro_org.name}"]
}

resource "aws_route53_zone" "gyrate_org" {
  name    = "gyrate.org."
  comment = ""
}

resource "aws_route53_record" "a_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "${aws_route53_zone.gyrate_org.name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.gyrate_org.website_domain}"
    zone_id                = "${aws_s3_bucket.gyrate_org.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "a_www_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "www.${aws_route53_zone.gyrate_org.name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.www_gyrate_org.website_domain}"
    zone_id                = "${aws_s3_bucket.www_gyrate_org.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "a_mail_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "mail.${aws_route53_zone.gyrate_org.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.mail.public_ip}"]
}

resource "aws_route53_record" "mx_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "${aws_route53_zone.gyrate_org.name}"
  type    = "MX"
  ttl     = "60"
  records = ["10 mail.${aws_route53_zone.gyrate_org.name}"]
}

resource "aws_route53_record" "cname_bloarzeyd_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "bloarzeyd.${aws_route53_zone.gyrate_org.name}"
  type    = "CNAME"
  ttl     = "60"
  records = ["bloarzeyd.github.com"]
}

resource "aws_route53_health_check" "mail" {
  ip_address        = "${aws_eip.mail.public_ip}"
  type              = "TCP"
  port              = 25
  request_interval  = 30
  failure_threshold = 2

  regions = [
    "us-east-1",
    "us-west-1",
    "us-west-2",
  ]

  tags = {
    Name = "mail"
  }
}
