variable "zone_id" {
  description = "Route 53 zone id"
}

variable "mail_from_subdomain" {
  description = "Mail-from subdomain"
  default     = "outbound-smtp"
}

variable "complaint_notification_topic_ids" {
  description = "SES notification topics for complaints"
  default     = []
}
