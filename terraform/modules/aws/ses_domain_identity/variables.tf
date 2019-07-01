variable "zone_id" {
  description = "Route 53 zone id"
}

variable "mail_from_subdomain" {
  description = "Mail-from subdomain"
  default     = "outbound-smtp"
}

variable "notification_topic_complaint" {
  description = "SES notification topic for complaints"
}
