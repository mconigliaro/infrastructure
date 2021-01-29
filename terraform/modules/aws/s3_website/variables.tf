variable "zone_id" {
  description = "Route 53 zone id"
}

variable "files" {
  description = "List of files"
  type = list(object({
    name         = string,
    content_type = string
  }))
  default = []
}

variable "index_document" {
  description = "Index document"
  default     = "index.html"
}

variable "error_document" {
  description = "Error document"
}
