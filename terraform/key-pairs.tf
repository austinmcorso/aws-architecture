resource "aws_key_pair" "default_keypair" {
  key_name = "${var.vpc_name}-keypair"
  public_key = "${file(\"ssh/aws-terraform.pub\")}"
}
