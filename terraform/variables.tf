variable "access_key" {}
variable "secret_key" {}
variable "vpc_name" {}
variable "password" {}

variable "region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_one_cidr" {
  description = "CIDR for public subnet one"
  default     = "10.0.1.0/24"
}

variable "public_subnet_two_cidr" {
  description = "CIDR for public subnet two"
  default     = "10.0.2.0/24"
}

variable "private_subnet_one_cidr" {
  description = "cidr for private subnet one"
  default     = "10.0.3.0/24"
}

variable "private_subnet_two_cidr" {
  description = "CIDR for private subnet two"
  default     = "10.0.4.0/24"
}


/* Amazon Linux AMI */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-east-1 = "ami-6869aa05"
  }
}

variable "identifier" {
  default = "prod-rds"
  description = "Identifier for your DB"
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

variable "db_name" {
  default = "changeme"
  description = "db name"
}

variable "username" {
  default = "changeme"
  description = "User name"
}

variable "rds_is_multi_az" {
      default = "true"
}

