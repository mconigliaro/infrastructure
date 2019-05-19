variable "zone_id" {
  description = "Route 53 zone id"
}

variable "mail_from_subdomain" {
  description = "Mail-from subdomain"
  default     = "outbound-smtp"
}
