variable "access_key" {}
variable "secret_key" {}
variable "vpc_name" {}
variable "password" {}
variable "db_name" {}
variable "username" {}
variable "identifier" {}

/* Region */
variable "region" {}

/* VPC CDIR */
variable "vpc_cidr" {}

/* Public Subnet one */
variable "public_subnet_one_cidr" {}

/* Public Subnet two */
variable "public_subnet_two_cidr" {}

/* Private Subnet one */
variable "private_subnet_one_cidr" {}

/* Private Subnet two */
variable "private_subnet_two_cidr" {}

variable "environment" {
  default = "prod"
}

variable "public_subnet_one_availability_zone" {
  description = "Availability zone for public subnet one"
  default     = "us-east-1a"
}

variable "public_subnet_two_availability_zone" {
  description = "Availability zone for public subnet two"
  default     = "us-east-1b"
}

variable "private_subnet_one_availability_zone" {
  description = "Availability zone for private subnet one"
  default     = "us-east-1c"
}

variable "private_subnet_two_availability_zone" {
  description = "Availability zone for private subnet two"
  default     = "us-east-1e"
}

/* Amazon Linux AMI */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-east-1 = "ami-6869aa05"
  }
}

variable "storage" {
  default = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default = "mariadb"
  description = "Engine type, example values mysql, postgres, mariadb"
}

variable "instance_class" {
  default = "db.t2.micro"
  description = "Instance class"
}

variable "rds_is_multi_az" {
  default = "true"
}

variable "public_app_server_amazon_linux_ami" {
  description = "AMI for Amazon Linux Distro"
  default = "ami-6869aa05"
}

variable "public_app_server_amazon_redhat_ami" {
  description = "AMI for RedHat Linux Distro"
  default = "ami-2051294a"
}

variable "public_app_server_amazon_ubuntu_ami" {
  description = "AMI for Ubuntu Linux Distro"
  default = "ami-2d39803a"
}

variable "public_app_server_custom_ami" {
  default = "ami-8d24b29a"
}

variable "public_app_server_openvpn_ami" {
  default = "ami-38a3292f"
}

variable "public_app_server_instance_type" {
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
  default = "t2.micro"
}
