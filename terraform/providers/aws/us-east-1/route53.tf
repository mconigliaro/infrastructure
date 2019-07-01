resource "aws_route53_zone" "conigliaro_org" {
  name    = "conigliaro.org."
  comment = ""
}

module "mail_conigliaro_org" {
  source    = "../../../modules/aws/route53_mail_records"
  zone_id   = "${aws_route53_zone.conigliaro_org.id}"
  target_ip = "${aws_eip.mail.public_ip}"
}

resource "aws_route53_zone" "gyrate_org" {
  name    = "gyrate.org."
  comment = ""
}

module "mail_gyrate_org" {
  source    = "../../../modules/aws/route53_mail_records"
  zone_id   = "${aws_route53_zone.gyrate_org.id}"
  target_ip = "${aws_eip.mail.public_ip}"
}

resource "aws_route53_record" "cname_bloarzeyd_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name    = "bloarzeyd.${aws_route53_zone.gyrate_org.name}"
  type    = "CNAME"
  ttl     = "300"
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
