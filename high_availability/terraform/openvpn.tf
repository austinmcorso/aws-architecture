/* High Availablity OpenVPN for VPC */
resource "aws_instance" "openvpn_one_public_server" {
    ami = "${var.public_app_server_openvpn_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_public.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    tags {
        Name = "${var.vpc_name}-openvpn01-public-server"
        Environment = "${var.environment}"
    }
}

resource "aws_instance" "openvpn_two_public_server" {
    ami = "${var.public_app_server_openvpn_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_public.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    security_groups = ["${aws_security_group.default_public_servers_sg.id}"]
    tags {
        Name = "${var.vpc_name}-openvpn02-public-server"
        Environment = "${var.environment}"
    }
}

output "openvpn_one_public_server_hostname" {
  value = "${aws_instance.openvpn_one_public_server.public_dns}"
}

output "openvpn_one_public_server_internal_ip" {
  value = "${aws_instance.openvpn_one_public_server.private_ip}"
}

output "openvpn_two_public_server_hostname" {
  value = "${aws_instance.openvpn_two_public_server.public_dns}"
}

output "openvpn_two_public_server_internal_ip" {
  value = "${aws_instance.openvpn_two_public_server.private_ip}"
}
