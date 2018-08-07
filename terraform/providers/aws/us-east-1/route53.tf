resource "aws_route53_zone" "conigliaro_org" {
  name = "conigliaro.org."
  comment = ""
}

resource "aws_route53_zone" "gyrate_org" {
  name = "gyrate.org."
  comment = ""
}
