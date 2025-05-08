
output "user_name" {
  value = length(aws_iam_user.this) > 0 ? aws_iam_user.this[0].name : null
}

output "user_arn" {
  value = length(aws_iam_user.this) > 0 ? aws_iam_user.this[0].arn : null
}

output "role_name" {
  value = length(aws_iam_role.this) > 0 ? aws_iam_role.this[0].name : null
}

output "role_arn" {
  value = length(aws_iam_role.this) > 0 ? aws_iam_role.this[0].arn : null
}

