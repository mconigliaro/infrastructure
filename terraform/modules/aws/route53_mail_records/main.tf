data "aws_route53_zone" "selected" {
  zone_id = "${var.zone_id}"
}

resource "aws_route53_record" "a" {
  zone_id = "${var.zone_id}"
  name    = "mail.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["${var.target_ip}"]
}

resource "aws_route53_record" "mx" {
  zone_id = "${var.zone_id}"
  name    = "${data.aws_route53_zone.selected.name}"
  type    = "MX"
  ttl     = "300"
  records = ["10 mail.${data.aws_route53_zone.selected.name}"]
}
