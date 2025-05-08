
variable "mode" {
  description = "Access mode: 'iam-user' or 'cross-account-role'"
  type        = string
  default     = "iam-user"
}

variable "user_name" {
  description = "IAM user name (for 'iam-user' mode). Defaults to 'finops-review-user'."
  type        = string
  default     = "finops-review-user"
}

variable "service_provider_account_id" {
  description = "AWS account ID of the service provider (for 'cross-account-role' mode)"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "IAM role name (for 'cross-account-role' mode). Defaults to 'FinOpsCostReviewRole'."
  type        = string
  default     = "FinOpsCostReviewRole"
}

variable "attach_organizations_policy" {
  description = "Whether to attach AWSOrganizationsReadOnlyAccess policy"
  type        = bool
  default     = false
}
