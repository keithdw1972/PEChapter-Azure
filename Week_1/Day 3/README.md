# Infrastructure as Code Pathway

## Terraform Exercises
1. Provision a virtual machine in a virtual network. Basic hard-coded Terraform configuration.
2. Define resource dependencies within the code base.
3. Introduce variables to replace hard-coded values.
4. Split out the single main.tf into separate files.
5. Generate a random password for usage with the virtual machine to improve security.

### Required Prerequisites
- Download of an approciate editor e.g VSCode
- Understanding of basic cloud concepts (AWS & Azure)

### Learning Objectives
1. Understand the key concept of Infrastructure as Code (IaC)
2. Understand the key concepts of Terraform
3. Understand input variables within Terraform
4. Understand best practices for Terraform structure and file separation

### Key Concepts

| Concept                |
| ---------------------- |
| Infrastructure as Code |
| Terraform              |
| Input variables        |

### Useful Resources
- [Infrastructure as Code](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac)
- [IaC with Terraform](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code)
- [Input variables](https://www.terraform.io/language/values/variables)

## Codebase version history

| Version | Description                                                                       | Platform    |
| :-----: | :---------------------------------------------------------------------------------| ----------: |
|   v1    | Hard coded minimal virtual machine and network configuration                      | AWS & Azure |
|   v2    | Hard coded configuration but taking into account resource (implicit) dependencies | Azure       |
|   v3    | Use of variables instead of hard coding                                           | AWS & Azure |
|   v4    | Reorganise files to make them easier to digest                                    | AWS & Azure |
|   v5    | Creation of random VM password for security                                       | Azure       |

[github-link]: https://github.com/wesley-trust/TerraformTraining