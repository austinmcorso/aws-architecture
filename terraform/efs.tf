resource "aws_efs_file_system" "default_efs" {
  reference_name = "default_vpc_efs"
  tags {
    Name = "${var.vpc_name}-efs"
  }
}
