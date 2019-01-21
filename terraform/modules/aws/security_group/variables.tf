variable "name" {
  description = "Security group name"
}

variable "description" {
  description = "Security group description"
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC id"
}
