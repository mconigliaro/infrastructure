resource "aws_cloudwatch_metric_alarm" "billing_estimated_charges" {
  alarm_name  = "billing-estimated_charges"
  namespace   = "AWS/Billing"
  metric_name = "EstimatedCharges"

  dimensions {
    Currency = "USD"
  }

  period              = 21600                           # 6 hours
  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = 6
  evaluation_periods  = 1

  alarm_actions             = ["${aws_sns_topic.alerts.id}"]
  ok_actions                = ["${aws_sns_topic.alerts.id}"]
  insufficient_data_actions = ["${aws_sns_topic.alerts.id}"]
}

resource "aws_cloudwatch_metric_alarm" "route53_health_check_status" {
  alarm_name  = "mail-route53_health_check_status"
  namespace   = "AWS/Route53"
  metric_name = "HealthCheckStatus"

  dimensions {
    HealthCheckId = "${aws_route53_health_check.mail.id}"
  }

  period              = 300
  statistic           = "Average"
  comparison_operator = "LessThanThreshold"
  threshold           = 1
  evaluation_periods  = 3

  alarm_actions             = ["${aws_sns_topic.alerts.id}"]
  ok_actions                = ["${aws_sns_topic.alerts.id}"]
  insufficient_data_actions = ["${aws_sns_topic.alerts.id}"]
}
