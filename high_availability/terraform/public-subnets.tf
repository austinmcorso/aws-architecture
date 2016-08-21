/* Public subnet one*/
resource "aws_subnet" "default_subnet_one_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_one_cidr}"
  availability_zone = "${var.availability_zone_one}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.public_subnet_one_cidr} - ${var.availability_zone_one} - public"
  }
}

/* Public subnet two*/
resource "aws_subnet" "default_subnet_two_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_two_cidr}"
  availability_zone = "${var.availability_zone_two}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.public_subnet_two_cidr} - ${var.availability_zone_two} - public"
  }
}

/* Public subnet three*/
resource "aws_subnet" "default_subnet_three_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_three_cidr}"
  availability_zone = "${var.availability_zone_three}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.public_subnet_three_cidr} - ${var.availability_zone_three} - public"
  }
}

/* Public subnet four*/
resource "aws_subnet" "default_subnet_four_public" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.public_subnet_four_cidr}"
  availability_zone = "${var.availability_zone_four}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.public_subnet_four_cidr} - ${var.availability_zone_four} - public"
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

/* Assign routing table to public subnet */
resource "aws_route_table_association" "default_route_table_association_three_public" {
  subnet_id = "${aws_subnet.default_subnet_three_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}

/* Assign routing table to public subnet */
resource "aws_route_table_association" "default_route_table_association_four_public" {
  subnet_id = "${aws_subnet.default_subnet_four_public.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_public.id}"
}


