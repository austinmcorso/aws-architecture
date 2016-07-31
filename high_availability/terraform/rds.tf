resource "aws_db_subnet_group" "default_db_subnet_group" {
  name = "${var.vpc_name}-db_subnet_group"
  description = "Main group of private subnets"
  subnet_ids = ["${aws_subnet.10030_us_east_1c_private.id}", "${aws_subnet.10040_us_east_1e_private.id}"]
}

resource "aws_db_instance" "default_rds" {
  depends_on = ["aws_security_group.default_rds_sg"]
  identifier = "${var.identifier}"
  allocated_storage = "${var.storage}"
  engine = "${var.engine}"
  instance_class = "${var.instance_class}"
  name = "${var.db_name}"
  username = "${var.username}"
  password = "${var.password}"
  multi_az = "${var.rds_is_multi_az}"
  vpc_security_group_ids = ["${aws_security_group.default_rds_sg.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.default_db_subnet_group.id}"
}

resource "aws_security_group" "default_rds_sg" {
  name = "${var.vpc_name}_rds_sg"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_rds_sg"
  }
}

