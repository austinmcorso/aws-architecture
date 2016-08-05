resource "aws_efs_file_system" "default_efs" {
  reference_name = "default_vpc_efs"
  tags {
    Name = "${var.vpc_name}-efs"
  }
}

resource "aws_efs_mount_target" "default_efs_mount_target_one_efs_mount_target" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_one_public.id}"
  security_groups = ["${aws_security_group.default_rds_sg.id}"]
}

resource "aws_efs_mount_target" "default_efs_mount_target_two_efs_mount_target" {
  file_system_id = "${aws_efs_file_system.default_efs.id}"
  subnet_id = "${aws_subnet.default_subnet_two_public.id}"
  security_groups = ["${aws_security_group.default_rds_sg.id}"]
}
