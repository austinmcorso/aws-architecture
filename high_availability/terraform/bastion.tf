// EC2 Instance Resource for Module
resource "aws_instance" "nat_gateway" {
    ami = "ami-184dc970"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_public.id}"
    instance_type = "t2.micro"
    source_dest_check = false
    tags {
        Name = "${var.vpc_name}-nat-server"
    }
}
