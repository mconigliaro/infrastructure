resource "aws_cloudwatch_metric_alarm" "billing_estimated_charges" {
  alarm_name  = "billing_estimated_charges"
  namespace   = "AWS/Billing"
  metric_name = "EstimatedCharges"

  dimensions = {
    Currency = "USD"
  }

  period              = 21600 # 6 hours
  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = 7
  evaluation_periods  = 1

  alarm_actions             = [aws_sns_topic.alerts.id]
  ok_actions                = [aws_sns_topic.alerts.id]
  insufficient_data_actions = [aws_sns_topic.alerts.id]
}

resource "aws_cloudwatch_metric_alarm" "mail_route53_health_check_status" {
  alarm_name  = "mail_route53_health_check_status"
  namespace   = "AWS/Route53"
  metric_name = "HealthCheckStatus"

  dimensions = {
    HealthCheckId = aws_route53_health_check.mail.id
  }

  period              = 300
  statistic           = "Average"
  comparison_operator = "LessThanThreshold"
  threshold           = 1
  evaluation_periods  = 2

  alarm_actions             = [aws_sns_topic.alerts.id]
  ok_actions                = [aws_sns_topic.alerts.id]
  insufficient_data_actions = [aws_sns_topic.alerts.id]
}

resource "aws_cloudwatch_metric_alarm" "mail_status_check_failed" {
  alarm_name  = "mail_status_check_failed"
  namespace   = "AWS/EC2"
  metric_name = "StatusCheckFailed"

  dimensions = {
    InstanceId = aws_instance.mail-2020-03-09.id
  }

  period              = 300
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 0
  evaluation_periods  = 2

  alarm_actions = [aws_sns_topic.alerts.id]
  ok_actions    = [aws_sns_topic.alerts.id]
}

resource "aws_cloudwatch_metric_alarm" "mail_cpu_utilization" {
  alarm_name  = "mail_cpu_utilization"
  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"

  dimensions = {
    InstanceId = aws_instance.mail-2020-03-09.id
  }

  period              = 300
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 20
  evaluation_periods  = 2

  alarm_actions = [aws_sns_topic.alerts.id]
  ok_actions    = [aws_sns_topic.alerts.id]
}
