module "finops_access" {
  source     = "../../"
  mode       = "iam-user"
  account_id = "123456789012"
  user_name  = "custom-finops-user"
  role_name  = "custom-finops-role"
}
