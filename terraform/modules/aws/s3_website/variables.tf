variable "zone_id" {
  description = "Route 53 zone id"
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
