variable "domain_name" {
  description = "Domain name"
}

variable "zone_id" {
  description = "Domain name zone id"
}

variable "files" {
  description = "List of files"
  default     = []
}

variable "index_document" {
  description = "Index document"
  default     = "index.html"
}

variable "error_document" {
  description = "Error document"
  default     = "index.html"
}
