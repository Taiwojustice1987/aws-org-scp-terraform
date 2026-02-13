variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "root_target_id" {
  type        = string
  description = "Root target ID (usually r-xxxx)"
}

variable "dev_ou_id" {
  type        = string
  description = "Dev OU ID (ou-xxxx-xxxxxxxx)"
}
