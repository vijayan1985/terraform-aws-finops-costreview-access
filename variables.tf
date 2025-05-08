variable "mode" {
  description = "Access mode: 'iam-user' or 'cross-account-role'"
  type        = string
  default     = "iam-user"
}

# iam-user mode
variable "user_name" {
  description = "IAM user name (for 'iam-user' mode). Defaults to 'finops-review-user'."
  type        = string
  default     = "finops-review-user"
}

# cross-account-role mode
variable "service_provider_account_id" {
  description = "AWS account ID of the service provider (for 'cross-account-role' mode)"
  type        = string
  default     = ""
}

variable "service_provider_role_name" {
  description = "Role name in the service provider account (for 'cross-account-role' mode)"
  type        = string
  default     = ""
}

variable "external_id" {
  description = "External ID to require in the AssumeRole call (optional, for 'cross-account-role' mode)"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "IAM role name (for 'cross-account-role' mode). Defaults to 'FinOpsCostReviewRole'."
  type        = string
  default     = "FinOpsCostReviewRole"
}

# both modes
variable "attach_organizations_policy" {
  description = "Whether to attach AWSOrganizationsReadOnlyAccess policy"
  type        = bool
  default     = false
}

variable "account_id" {
  description = "AWS Account ID where the resources will be created"
  type        = string
  default     = "000000000000"
}

