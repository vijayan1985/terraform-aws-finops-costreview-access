
resource "aws_iam_user" "this" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = var.user_name
}

resource "aws_iam_role" "this" {
  count = var.mode == "cross-account-role" ? 1 : 0
  name  = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::${var.service_provider_account_id}:root"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
