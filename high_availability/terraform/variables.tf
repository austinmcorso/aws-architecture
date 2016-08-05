variable "access_key" {}
variable "secret_key" {}
variable "vpc_name" {}
variable "password" {}
variable "db_name" {}
variable "username" {}
variable "identifier" {}

/* Region */
variable "region" {
    default = "us-east-1"
}

/* VPC CDIR */
variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

/* Public Subnet one */
variable "public_subnet_one_cidr" {
  description = "CIDR for public subnet one"
  default     = "10.0.1.0/24"
}

variable "public_subnet_one_availability_zone" {
  description = "Availability zone for public subnet one"
  default     = "us-east-1a"
}

/* Public Subnet two */
variable "public_subnet_two_cidr" {
  description = "CIDR for public subnet two"
  default     = "10.0.2.0/24"
}

variable "public_subnet_two_availability_zone" {
  description = "Availability zone for public subnet one"
  default     = "us-east-1b"
}

/* Private Subnet one */
variable "private_subnet_one_cidr" {
  description = "cidr for private subnet one"
  default     = "10.0.3.0/24"
}

variable "private_subnet_one_availability_zone" {
  description = "Availability zone for public subnet one"
  default     = "us-east-1c"
}

/* Private Subnet two */
variable "private_subnet_two_cidr" {
  description = "CIDR for private subnet two"
  default     = "10.0.4.0/24"
}

variable "private_subnet_two_availability_zone" {
  description = "Availability zone for public subnet one"
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

