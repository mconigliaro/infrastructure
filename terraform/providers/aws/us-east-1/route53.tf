resource "aws_route53_zone" "conigliaro_org" {
  name = "conigliaro.org."
  comment = ""
}

resource "aws_route53_record" "mx_conigliaro_org" {
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
  name = "${aws_route53_zone.conigliaro_org.name}"
  type = "MX"
  ttl = "300"
  records = [ "10 mail.${aws_route53_zone.conigliaro_org.name}" ]
}

resource "aws_route53_zone" "gyrate_org" {
  name = "gyrate.org."
  comment = ""
}

resource "aws_route53_record" "mx_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name = "${aws_route53_zone.gyrate_org.name}"
  type = "MX"
  ttl = "300"
  records = [ "10 mail.${aws_route53_zone.gyrate_org.name}" ]
}

resource "aws_route53_record" "cname_bloarzeyd_gyrate_org" {
  zone_id = "${aws_route53_zone.gyrate_org.id}"
  name = "bloarzeyd.${aws_route53_zone.gyrate_org.name}"
  type = "CNAME"
  ttl = "300"
  records = [ "bloarzeyd.github.com" ]
}
