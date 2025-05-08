resource "aws_iam_user" "this" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = var.user_name
}

resource "aws_iam_role" "this" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:user/${var.user_name}"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_user_policy" "assume_role" {
  count = var.mode == "iam-user" ? 1 : 0
  name  = "${var.user_name}-assume-role"
  user  = aws_iam_user.this[0].name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = aws_iam_role.this[0].arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "billing_readonly" {
  count      = var.mode == "iam-user" ? 1 : 0
  role       = aws_iam_role.this[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_readonly" {
  count      = var.mode == "iam-user" ? 1 : 0
  role       = aws_iam_role.this[0].name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "organizations_readonly" {
  count      = var.attach_organizations_policy && var.mode == "iam-user" ? 1 : 0
  role       = aws_iam_role.this[0].name
  policy_arn = "arn:aws:iam::aws:policy/AWSOrganizationsReadOnlyAccess"
}

