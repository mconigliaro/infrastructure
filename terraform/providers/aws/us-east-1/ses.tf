module "ses_domain_identity_conigliaro_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
}

module "ses_domain_identity_gyrate_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.gyrate_org.id}"
}
