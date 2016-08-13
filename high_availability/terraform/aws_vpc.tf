/* Create our default_vpc */
resource "aws_vpc" "default_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags { 
    Name = "${var.vpc_name}-vpc" 
  }
}
