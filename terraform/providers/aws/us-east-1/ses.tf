module "ses_domain_identity_conigliaro_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.conigliaro_org.id}"

  bounce_notification_topic_ids = [
    "${aws_sns_topic.alerts.id}",
  ]

  complaint_notification_topic_ids = [
    "${aws_sns_topic.alerts.id}",
  ]
}

module "ses_domain_identity_gyrate_org" {
  source  = "../../../modules/aws/ses_domain_identity"
  zone_id = "${aws_route53_zone.gyrate_org.id}"

  bounce_notification_topic_ids = [
    "${aws_sns_topic.alerts.id}",
  ]

  complaint_notification_topic_ids = [
    "${aws_sns_topic.alerts.id}",
  ]
}
