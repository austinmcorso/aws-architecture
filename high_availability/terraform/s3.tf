/* Create S3 Bucket */
resource "aws_s3_bucket" "default_s3_bucket" {
    bucket = "${var.vpc_name}_bucket"
    acl = "private"

    tags {
        Name = "${var.vpc_name}_bucket"
        Environment = "prod"
    }
}
