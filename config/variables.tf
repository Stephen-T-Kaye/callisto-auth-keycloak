variable "callisto_realm" {
  type        = string
  description = "The keycloak realm for callisto"
  sensitive   = true
}

variable "callisto_url" {
  type        = string
  description = "The website url for callisto"
  sensitive   = true
}

variable "include_test_users" {
  type        = bool
  description = "Whether to include test users or not"
  default     = false
}

variable "aws_provider_skip_requesting_account_id" {
  type        = bool
  description = "Skip requesting the AWS account ID"
  default     = false
}