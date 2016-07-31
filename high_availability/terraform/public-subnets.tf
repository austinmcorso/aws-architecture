/* Public subnet 1a*/
resource "aws_subnet" "10010_us_east_1a_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_one_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "${var.vpc_name} - 10.0.1.0 - us-east-1a - public" 
  }
}

/* Public subnet 1b*/
resource "aws_subnet" "10020_us_east_1b_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_two_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "${var.vpc_name} - 10.0.2.0 - us-east-1b - public" 
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
resource "aws_route_table_association" "10010_us_east_1a_public" {
  subnet_id = "${aws_subnet.10010_us_east_1a_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}

/* Assign routing table to public subnet */
resource "aws_route_table_association" "10020_us_east_1b_public" { 
  subnet_id = "${aws_subnet.10020_us_east_1b_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}

