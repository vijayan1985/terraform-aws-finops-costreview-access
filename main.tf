
resource "aws_iam_user" "this" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = var.user_name
}

resource "aws_iam_user_policy" "assume_role" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = "${var.user_name}-assume-role"
  user  = aws_iam_user.this[0].name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = "sts:AssumeRole",
      Resource = aws_iam_role.this[0].arn
    }]
  })
}

resource "aws_iam_role" "this" {
  count = var.mode == "cross-account-role" ? 1 : 0
  name  = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::${var.service_provider_account_id}:role/${var.service_provider_role_name}"
      },
      Action = "sts:AssumeRole",
      Condition = var.external_id != "" ? {
        StringEquals = {
          "sts:ExternalId" = var.external_id
        }
      } : null
    }]
  })
}

