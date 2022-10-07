# Terraform -- Getting a Better Understanding

## Overview

Found new infrastructure to build. this will allow me to get some hands on experience with different AWS services using Terraform. Following this [Guide](https://www.itwonderlab.com/en/terraform-ansible-aws-howto/)  and provided access this [GitHub Repo]() will give me a better understanding using different AWS Services along with Terraform Infrastructure.

-----


# Getting Started

### Web-App

Generic web application architecture including:
   - 1 VPC
   - 4 subnets
   - 4 security groups
   - 3 route tables
   - 1 EC2 instance
   - 1 Internet Gateway
   - 1 Route 53 Hosted zone
   - 1 DB Subnet Group
   - 1 RDS MariaDB

This example will be refined and improved in later modules.

### Architecture
![](/infrasturcture-diagram/ITWL_AWS_Terraform_VPC_SN2.png)

----

## Guides
- [Complete Terraform Guide](https://www.youtube.com/watch?v=7xngnjfIlK4&t=130s)
- [GitHub Repo](git@github.com:itwonderlab/terraform-aws-ec2-rds-basic-free.gite)

----

## Running Terraform

Run the following to ensure ***terraform*** will only perform the expected
actions:

```sh
terraform fmt
terraform validate
terraform plan
terraform init
```

## Tearing Down the Terraformed Cluster

Run the following to verify that ***terraform*** will only impact the expected
nodes and then tear down the cluster.

```sh
terraform plan
terraform destroy
```
----

## VPC Subnet Creation

The VPC will be created using the `172.17.32.0/19` private IPv4 address range (8192 IPs) divided into many smaller subnets of 512 hosts (sub netmask /23). See [ipv4 Subnet Calculator](https://www.site24x7.com/tools/ipv4-subnetcalculator.html)

For the demo, we will only provision 4 subnets. 
![](/infrasturcture-diagram/ITWL_AWS_Terraform_VCP_SN2.png)

*VPC using AWS availability zones with a private and a public network*

Instance placement has to take into account that data transfer between different Availability Zones has a cost, therefore achieving high availability by distributing infrastructure between Availability Zones has an impact on the total budget

----

## VPC/RDS Subnets, Routing, and Internet Access

This is part 2 of 5 of the Terraform and Ansible tutorial for AWS. It is used to create a VPC in AWS with an EC2 instance connected to MariaDB database running in RDS using a single Terraform plan. Ansible is used to configure the server and install all the needed packages.

## VPC Subnet Routing

Since we have deleted the default VPC, AWS needs new routing tables to connect our VPC subnets to the Internet.

![](/infrasturcture-diagram/terraform-ansible-aws-howto-VPC-Routing.png)

*Two zones, with public and private networks in an AWS Region*

The name of the resources will follow a pattern:

   -  **Cloud**: a prefix specifying the unique name of this cloud across all available clouds and providers. In this case the prefix will be: **ditwl** that stands for **Demo IT Wonder Lab** in lowercase.
   - **Resource**: a short name identifying the resource, in this case:
      -  **rt**: for routing table
      -  **igw**: for Internet gateway
      -  **ir**: for Internet route
   - **Visibility**: for resources that can be either public or private, a 3 letter acronym for the visibility:
     -  **pub**: for public resources
     -  **pri**: for private resources
   - **Name**: optional a name that describes the usage of the resource, for example the routing tables for private zones A and B will be **za** and **zb**.

Public subnets get access to the Internet using an [Internet Gateway](https://www.itwonderlab.com/en/aws-naming-best-practices/).

---



[tfhome](https://www.terraform.io)
[tfdocs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)