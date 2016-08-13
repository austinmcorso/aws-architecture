/* Bastion Instance for netwprk */
resource "aws_instance" "bastion_one" {
  ami = "${var.public_app_server_amazon_linux_ami}"
  count = "1"
  instance_type = "${var.bastion_server_instance_type}"
  subnet_id = "${aws_subnet.default_subnet_one_public.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.default_security_group_bastion_sg.id}"]
  key_name = "${var.vpc_name}-keypair"
  user_data = "${file("cloud-config/bastion.sh")}"

  tags = {
    Name = "${var.vpc_name}_bastion"
    Environment = "dmz"
  }
}

/* Allocate EIP to bastion host */
resource "aws_eip" "default_eip_bastion_one" {
  instance = "${aws_instance.bastion_one.id}"
  vpc = true
}
