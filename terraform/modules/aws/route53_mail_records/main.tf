resource "aws_route53_record" "a" {
  zone_id = "${var.zone_id}"
  name    = "mail.${var.zone_name}"
  type    = "A"
  ttl     = "300"
  records = ["${var.target_ip}"]
}

resource "aws_route53_record" "mx" {
  zone_id = "${var.zone_id}"
  name    = "${var.zone_name}"
  type    = "MX"
  ttl     = "300"
  records = ["10 mail.${var.zone_name}"]
}
