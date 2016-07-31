# Automating AWS Infrastructure with Terraform

## Setup
- Create private key
 - ssh-keygen -t rsa -C "aws-terraform" -P '' -f ssh/aws-terraform
- Create terraform.tfvars with local vars
 - access_key
 - secret_key
 - password
 - vpc_name

## Review VPC plan
- terraform plan

## Create VPC environment(s)
- terraform apply

## Tear Down
- terraform destroy

