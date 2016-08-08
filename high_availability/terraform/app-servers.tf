// Default EC2 Instance Resources for High Availability Module
resource "aws_instance" "web_one_public_server" {
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_public.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    user_data = "${file("cloud-config/init.sh")}"
    tags {
        Name = "${var.vpc_name}-web01-public-server"
        Environment = "${var.environment}"
    }
}

resource "aws_instance" "web_two_public_server" {
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_public.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/init.sh")}"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    tags {
        Name = "${var.vpc_name}-web02-public-server"
        Environment = "${var.environment}"
    }
}

