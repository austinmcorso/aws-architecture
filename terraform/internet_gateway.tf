/* Create internet gateway for the default_vpc */
resource "aws_internet_gateway" "default_igw" {
  vpc_id = "${aws_vpc.default_vpc.id}"
  tags {
    Name = "${var.vpc_name}-igw"
  }
}
