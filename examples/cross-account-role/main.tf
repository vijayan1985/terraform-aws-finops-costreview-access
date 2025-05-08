
module "finops_access" {
  source                      = "../../"
  mode                        = "cross-account-role"
  service_provider_account_id = "123456789012"
  role_name                   = "custom-finops-role"
  user_name                   = "custom-finops-user"
  attach_organizations_policy = true
}
