[![Terraform CI](https://github.com/elastic2ls-com/terraform-aws-finops-costreview-access/actions/workflows/terraform.yml/badge.svg)](https://github.com/elastic2ls-com/terraform-aws-finops-costreview-access/actions)
![License](https://img.shields.io/badge/license-MIT-brightgreen?logo=mit)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?logo=git)
[![Sponsor](https://img.shields.io/badge/sponsors-AlexanderWiechert-blue.svg?logo=github-sponsors)](https://github.com/sponsors/AlexanderWiechert/)
[![Contact](https://img.shields.io/badge/follow-@Elastic2lscom-blue.svg?logo=facebook&style=social)](https://www.facebook.com/Elastic2lscom-241339337786673/)
[![Terraform Registry](https://img.shields.io/badge/download-blue.svg?logo=terraform&style=social)](https://registry.terraform.io/modules/elastic2ls-com/finops-costreview-access/aws/latest)

# terraform-aws-finops-costreview-access


Terraform module to create an IAM user or cross-account IAM role for external FinOps cost reviews in an AWS account.

---

## Features

- Create **IAM user** with read-only access for Billing, Cost Explorer, CloudWatch.
- Create **cross-account IAM role** with trust policy for a service provider.
- Optional: attach `AWSOrganizationsReadOnlyAccess` policy.
- Flexible naming of user and role, with defaults.
- Includes examples and CI workflow with security checks.

---

## Usage

### IAM User (default mode)

```hcl
module "finops_access" {
  source      = "github.com/elastic2ls-com/terraform-aws-finops-costreview-access"
  mode        = "iam-user"
  account_id  = "123456789012"
  user_name   = "finops-review-user"
  role_name   = "finops-review-role"
}
```

### Cross-Account Role

```hcl
module "finops_access" {
  source                      = "github.com/elastic2ls-com/terraform-aws-finops-costreview-access"
  mode                        = "cross-account-role"
  service_provider_account_id = "123456789012"
  service_provider_role_name  = "finops-review-role"
  external_id                 = "your-secure-external-id"     # Optional
  role_name                   = "custom-finops-role"    # Optional, default: 'FinOpsCostReviewRole'
  user_name                   = "custom-finops-user"    # Optional, default: 'finops-review-user' (ignored in this mode)
  attach_organizations_policy = true
}
```

## Security Best Practices

- Use `service_provider_role_name` to limit access to a specific role.
- Set `external_id` to prevent the confused-deputy problem.
- Avoid using account root (`arn:aws:iam::<account_id>:root`) as principal.

---

## Examples

- [IAM User Example](./examples/iam-user/main.tf)
- [Cross-Account Role Example](./examples/cross-account-role/main.tf)

---

## Variables

| Name                        | Description                                                         | Type    | Default                  |
|-----------------------------|---------------------------------------------------------------------|---------|--------------------------|
| `mode`                     | Access mode: `'iam-user'` or `'cross-account-role'`                | string  | `"iam-user"`           |
| `user_name`                | IAM user name (for `iam-user` mode). Defaults to `'finops-review-user'`. | string  | `"finops-review-user"` |
| `service_provider_account_id` | AWS account ID of the service provider (for role mode)           | string  | `""`                  |
| `role_name`                | IAM role name (for `cross-account-role` mode). Defaults to `'FinOpsCostReviewRole'`. | string  | `"FinOpsCostReviewRole"` |
| `attach_organizations_policy` | Whether to attach `AWSOrganizationsReadOnlyAccess` policy        | bool    | `false`               |

---

## Outputs

| Name       | Description                      |
|------------|----------------------------------|
| `user_name` | IAM user name (if created)      |
| `user_arn`  | IAM user ARN (if created)       |
| `role_name` | IAM role name (if created)      |
| `role_arn`  | IAM role ARN (if created)       |

---

## Requirements

- Terraform ≥ 1.3
- AWS Provider ≥ 5.0

---

## CI/CD

This module uses GitHub Actions to run:
- `terraform fmt`
- `terraform validate`
- `terraform plan` on examples
- `checkov` security scan

---

## License

[MIT](./LICENSE)

---

## Maintainers

[elastic2ls](https://github.com/elastic2ls-com)
