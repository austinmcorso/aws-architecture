/* Public subnet one*/
resource "aws_subnet" "default_subnet_one_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_one_cidr}"
  availability_zone = "${var.public_subnet_one_availability_zone}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "${var.vpc_name} - ${var.public_subnet_one_cidr} - ${var.public_subnet_one_availability_zone} - public" 
  }
}

/* Public subnet two*/
resource "aws_subnet" "default_subnet_two_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_two_cidr}"
  availability_zone = "${var.public_subnet_two_availability_zone}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "${var.vpc_name} - ${var.public_subnet_two_cidr} - ${var.public_subnet_two_availability_zone} - public" 
  }
}

/* Create routing table for public subnet */
resource "aws_route_table" "default_vpc_rt_public" {
  vpc_id = "${aws_vpc.default_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default_igw.id}"
  }
  tags {
    Name = "${var.vpc_name}-rt-public"
  }
}

/* Assign routing table to public subnet */
resource "aws_route_table_association" "default_route_table_association_one_public" {
  subnet_id = "${aws_subnet.default_subnet_one_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}

/* Assign routing table to public subnet */
resource "aws_route_table_association" "default_route_table_association_two_public" { 
  subnet_id = "${aws_subnet.default_subnet_two_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}

