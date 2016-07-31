/* Private subnet 1c*/
resource "aws_subnet" "10030_us_east_1c_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_one_cidr}"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "10.0.3.0 - us-east-1c - private" 
  }
}

/* Private subnet 1e*/
resource "aws_subnet" "10040_us_east_1e_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_two_cidr}"
  availability_zone = "us-east-1e"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags { 
    Name = "10.0.4.0 - us-east-1e - private" 
  }
}

/* Create routing table for private subnet(s) */
resource "aws_route_table" "default_vpc_rt_private" {
  vpc_id = "${aws_vpc.default_vpc.id}"
  tags {
    Name = "${var.vpc_name}-rt-private"
  }
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "10030_us_east_1c_private" {
  subnet_id = "${aws_subnet.10030_us_east_1c_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "10040_us_east_1e_private" { 
  subnet_id = "${aws_subnet.10040_us_east_1e_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

