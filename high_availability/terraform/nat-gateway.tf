/* Allocate EIP to nat gateway */
resource "aws_eip" "default_eip_nat_gateway" {
  #instance = "${aws_nat_gateway.nat_gateway.id}"
  vpc = true
}

/* NAT Gateway */
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.default_eip_nat_gateway.id}"
  subnet_id = "${aws_subnet.default_subnet_one_public.id}"
  depends_on = ["aws_internet_gateway.default_igw"]
}

