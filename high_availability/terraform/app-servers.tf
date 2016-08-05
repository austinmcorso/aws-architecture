// EC2 Instance Resource for Module
resource "aws_instance" "web_one_public_server" {
    ami = "ami-8d24b29a"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_public.id}"
    instance_type = "t2.micro"
    key_name = "${var.vpc_name}-keypair"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    source_dest_check = false
    tags {
        Name = "${var.vpc_name}-web-public-server"
    }
}

resource "aws_instance" "web_two_public_server" {
    ami = "ami-8d24b29a"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_public.id}"
    instance_type = "t2.micro"
    key_name = "${var.vpc_name}-keypair"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    source_dest_check = false
    tags {
        Name = "${var.vpc_name}-web-public-server"
    }
}

