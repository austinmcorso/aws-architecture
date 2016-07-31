## Automating AWS Infrastructure with Terraform

#Setup
Create private key: ssh-keygen -t rsa -C "aws-terraform" -P '' -f ssh/aws-terraform

#Creating Amazon VPC
Examples:
# Review VPC plan
- terraform plan -var "vpc_name=clientXYZ-develop"

# Create VPC environment(s)

- terraform apply -var "vpc_name=clientXYZ-develop"
- terraform apply -var "vpc_name=clientXYZ-stage"
- terraform apply -var "vpc_name=clientXYZ-prod"

#Tear Down
- terraform destroy -var "vpc_name="ClientXYZ-develop"

