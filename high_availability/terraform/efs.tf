resource "aws_efs_file_system" "default_efs" {
  reference_name = "default_vpc_efs"
  tags {
    Name = "${var.vpc_name}-efs"
  }
}

resource "aws_security_group" "default_security_group_target_one_public" {
  name = "${var.vpc_name}_efs_one_public"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["${var.public_subnet_one_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_efs_one_public-sg"
  }
}

resource "aws_security_group" "default_security_group_target_two_public" {
  name = "${var.vpc_name}_efs_two_public"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["${var.public_subnet_two_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_efs_two_public-sg"
  }
}

resource "aws_security_group" "default_security_group_target_one_private" {
  name = "${var.vpc_name}_efs_one_private"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["${var.private_subnet_one_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_efs_one_private-sg"
  }
}

resource "aws_security_group" "default_security_group_target_two_private" {
  name = "${var.vpc_name}_efs_two_private"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["${var.private_subnet_two_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_efs_two_private-sg"
  }
}

/* EFS mount points on public subnets */
resource "aws_efs_mount_target" "default_efs_mount_target_one_public" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_one_public.id}"
  security_groups = ["${aws_security_group.default_security_group_target_one_public.id}"]
}

resource "aws_efs_mount_target" "default_efs_mount_target_two_public" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_two_public.id}"
  security_groups = ["${aws_security_group.default_security_group_target_two_public.id}"]
}

/* EFS mount points on private subnets */
resource "aws_efs_mount_target" "default_efs_mount_target_one_private" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_one_private.id}"
  security_groups = ["${aws_security_group.default_security_group_target_one_private.id}"]
}

resource "aws_efs_mount_target" "default_efs_mount_target_two_private" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_two_private.id}"
  security_groups = ["${aws_security_group.default_security_group_target_two_private.id}"]
}

output "efs_id" {
  value = "${aws_efs_file_system.default_efs.id}"
}
