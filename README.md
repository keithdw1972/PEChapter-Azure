# Infrastructure as Code Pathway
Terraform route with Terratest Unit/Integration Testing, Regula (OPA/Rego) Policy as Code & Azure DevOps CI/CD Pipeline

| Owner        | Maintainers                                          | Supporters                                                                            |
| :----------- | :--------------------------------------------------- | :------------------------------------------------------------------------------------ |
| Wesley Trust | Jack Byne, Josh Darling, Chris Simmons, Declan Griffith-barwell | Lydia Callan, Nawal Abdul Careem, Matt James, Keith Williams, Sol Arrascue Vega, Sheetal Taori |

## Learning & Development Plan

### Week 1
|  Day  | Delivery Lead | Support Lead       | Learning Path                                                                                                           |
| :---: | :-----------: | :----------------- | ----------------------------------------------------------------------------------------------------------------------- |
|   1   |   Jack Byne   | Lydia Callan       | [Fundamentals Introduction](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_1/Day_1) |
|   2   |   Jack Byne   | Lydia Callan       | [Fundamentals Introduction](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_1/Day_2) |
|   3   | Josh Darling  | Keith Williams     | [Terraform Exercises 1-5](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_1/Day_3)   |
|   4   | Josh Darling  | Matt James         | [Terraform Exercises 6-12](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_1/Day_4)  |
|   5   | Declan Griffith-barwell  | Sheetal Taori | [Terraform Exercises 13-16](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_1/Day_5) |

### Week 2

|  Day  | Delivery Lead | Support Lead            | Learning Path                                                                                                                                             |
| :---: | :-----------: | :---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
|   6   | Wesley Trust  | Nawal Abdul Careem | [Terratest Unit/Integration Testing Introduction & Exercises](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_2/Day_6) |
|   7   | Declan Griffith-barwell  | Sol Arrascue Vega | [Terraform Exercises 17-21](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_2/Day_7)                                   |
|   8   | Chris Simmons | Matt James              | [Terraform Exercises 22-24](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_2/Day_8)                                   |
|   9   | Chris Simmons | Keith Williams          | [Regula (OPA) Policy as Code Introduction & Exercises](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_2/Day_9)   |
|  10   | Wesley Trust  | Nawal Abdul Careem      | [Azure DevOps CI/CD Pipeline Introduction & Exercises](https://github.com/CG-CIS/pe-chapter-infrastructure-as-code-pathway/tree/main/Week_2/Day_10)     |

## [Codebase version history](https://github.com/wesley-trust/TerraformTraining/)
Iterative training module with versioned codebase corresponding to training exercises
| Version | Description                                                                                                                                           |
| :-----: | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
|   v1    | Hard coded minimal virtual machine and network configuration                                                                                          |
|   v2    | Hard coded configuration but taking into account resource (implicit) dependencies                                                                     |
|   v3    | Use of variables instead of hard coding                                                                                                               |
|   v4    | Reorganise files to make them easier to digest                                                                                                        |
|   v5    | Creation of random VM password for security                                                                                                           |
|   v6    | Add a count argument to create multiple virtual machines, ensuring unique naming                                                                      |
|   v7    | Add an availability set resource                                                                                                                      |
|   v8    | Add VMs to the availability set, which must be done at creation                                                                                       |
|   v9    | Convert to a module so it's possible to use a for_each to deploy to multiple regions for redundancy, in a single configuration                        |
|   v10   | Use of locals to calculate values, and use of region as a unique identifier (for VMs & resource groups)                                               |
|   v11   | Add a conditional expression to decide when to create an availability set                                                                             |
|   v12   | Add a conditional expression to decide when to add VMs to an availability zone, and ensuring each VM is in a different zone (up to maximum available) |
|   v13   | Modularise - Compute and Network now in separate modules                                                                                              |
|   v14   | Add more networking resources, including route tables and network security groups (NSGs) - introduce possible resource deadlock                       |
|   v15   | Add explicit dependency for network (to remove deadlock of interfaces being associated at the same time as route tables/NSGs)                         |
|   v16   | Create module to add multiple data disks to multiple virtual machines (with support for regions with and without availability zones)                  |
|   v17   | Create module for Linux virtual machine                                                                                                               |
|   v18   | Use function to calculate and set static IP address for virtual machines                                                                              |
|   v19   | Create module for provisioning public IP address and public load balancer (with zonal support)                                                        |
|   v20   | Add additional load balancer resources for backend configuration                                                                                      |
|   v21   | Add health probe and load balancer rule                                                                                                               |
|   v22   | Creation of Traffic Manager profile for global load balancing                                                                                         |
|   v23   | Addition of Traffic Manager endpoints for the public IP of each regional load balancer                                                                |
|   v24   | Creation of Key Vault module, and storage of VM passwords as encrypted secrets                                                                        |
|   v25   | Creation of Recovery Services Vault module, to allow for backups to be created                                                                        |
|   v26   | Addition of backup policies for VMs in the Recovery Services Vault                                                                                    |
|   v27   | Automate deployment in a CI/CD Pipeline with Azure DevOps using remote state                                                                          |