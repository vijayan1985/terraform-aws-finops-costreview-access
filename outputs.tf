
output "user_name" {
  description = "IAM user name (if created)"
  value       = var.mode == "iam-user" ? aws_iam_user.this[0].name : null
}

output "user_arn" {
  description = "IAM user ARN (if created)"
  value       = var.mode == "iam-user" ? aws_iam_user.this[0].arn : null
}

output "role_name" {
  description = "IAM role name (if created)"
  value       = var.mode == "cross-account-role" ? aws_iam_role.this[0].name : null
}

output "role_arn" {
  description = "IAM role ARN (if created)"
  value       = var.mode == "cross-account-role" ? aws_iam_role.this[0].arn : null
}
