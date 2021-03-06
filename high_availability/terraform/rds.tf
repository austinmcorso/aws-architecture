/* Database Subnet Group */
resource "aws_db_subnet_group" "default_db_subnet_group" {
  name = "${var.vpc_name}-db_subnet_group"
  description = "Main group of private subnets"
  subnet_ids = [
    "${aws_subnet.default_subnet_one_private.id}",
    "${aws_subnet.default_subnet_two_private.id}",
    "${aws_subnet.default_subnet_three_private.id}",
    "${aws_subnet.default_subnet_four_private.id}"
    ]
}

/* Default RDS Instance */
resource "aws_db_instance" "default_rds" {
  depends_on = ["aws_security_group.default_rds_sg"]
  identifier = "${var.identifier}"
  allocated_storage = "${var.storage}"
  engine = "${var.engine}"
  instance_class = "${var.instance_class}"
  backup_retention_period = 35
  name = "${var.db_name}"
  username = "${var.username}"
  password = "${var.password}"
  multi_az = "${var.rds_is_multi_az}"
  vpc_security_group_ids = ["${aws_security_group.default_rds_sg.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.default_db_subnet_group.id}"
}

/* Default RDS Security Group */
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
    Environment = "${var.environment}"
  }
}

/* Output */
output "database_host" {
    value = "${aws_db_instance.default_rds.endpoint}"
}
