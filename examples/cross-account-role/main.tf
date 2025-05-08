module "finops_access" {
  source                      = "../../"
  mode                        = "cross-account-role"
  account_id                  = "123456789012"
  service_provider_account_id = "987654321098"
  service_provider_role_name  = "finops-provider-role"
  role_name                   = "custom-finops-role"
  user_name                   = "custom-finops-user"
  attach_organizations_policy = true
}
