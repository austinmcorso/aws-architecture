resource "aws_efs_file_system" "default_efs" {
  reference_name = "default_vpc_efs"
  tags {
    Name = "${var.vpc_name}-efs"
  }
}

resource "aws_efs_mount_target" "default_us_east_1a_efs_mount_target" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.10010_us_east_1a_public.id}"
  security_groups = ["${aws_security_group.default_rds_sg.id}"]
}

resource "aws_efs_mount_target" "default_us_east_1b_efs_mount_target" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.10020_us_east_1b_public.id}"
  security_groups = ["${aws_security_group.default_rds_sg.id}"]
}
