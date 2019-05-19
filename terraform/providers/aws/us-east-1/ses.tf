module "ses_domain_identity_conigliaro_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.conigliaro_org.id}"
}

resource "aws_ses_identity_notification_topic" "conigliaro_org_complaint" {
  notification_type = "Complaint"
  identity          = "${module.ses_domain_identity_conigliaro_org.arn}"
  topic_arn         = "${aws_sns_topic.alerts.id}"
}

module "ses_domain_identity_gyrate_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.gyrate_org.id}"
}

resource "aws_ses_identity_notification_topic" "gyrate_org_complaint" {
  notification_type = "Complaint"
  identity          = "${module.ses_domain_identity_gyrate_org.arn}"
  topic_arn         = "${aws_sns_topic.alerts.id}"
}
