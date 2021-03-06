/* Private subnet one*/
resource "aws_subnet" "default_subnet_one_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_one_cidr}"
  availability_zone = "${var.availability_zone_one}"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.private_subnet_one_cidr} - ${var.availability_zone_one} - private"
  }
}

/* Private subnet two*/
resource "aws_subnet" "default_subnet_two_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_two_cidr}"
  availability_zone = "${var.availability_zone_two}"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.private_subnet_two_cidr} - ${var.availability_zone_two} - private"
  }
}

/* Private subnet three*/
resource "aws_subnet" "default_subnet_three_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_three_cidr}"
  availability_zone = "${var.availability_zone_three}"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.private_subnet_three_cidr} - ${var.availability_zone_three} - private"
  }
}

/* Private subnet four*/
resource "aws_subnet" "default_subnet_four_private" {
  vpc_id            = "${aws_vpc.default_vpc.id}"
  cidr_block        = "${var.private_subnet_four_cidr}"
  availability_zone = "${var.availability_zone_four}"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default_igw"]
  tags {
    Name = "${var.vpc_name} - ${var.private_subnet_four_cidr} - ${var.availability_zone_four} - private"
  }
}

/* Create routing table for private subnet(s) */
resource "aws_route_table" "default_vpc_rt_private" {
  vpc_id = "${aws_vpc.default_vpc.id}"
  depends_on = ["aws_nat_gateway.nat_gateway"]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }
  tags {
    Name = "${var.vpc_name}-rt-private"
  }
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "default_route_tabled_association_one_private" {
  subnet_id = "${aws_subnet.default_subnet_one_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "default_route_tabled_association_two_private" { 
  subnet_id = "${aws_subnet.default_subnet_two_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "default_route_tabled_association_three_private" {
  subnet_id = "${aws_subnet.default_subnet_three_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

/* Assign private routing table to private subnet */
resource "aws_route_table_association" "default_route_tabled_association_four_private" {
  subnet_id = "${aws_subnet.default_subnet_four_private.id}"
  route_table_id = "${aws_route_table.default_vpc_rt_private.id}"
}

