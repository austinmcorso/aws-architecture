/* Create S3 Bucket */
resource "aws_s3_bucket" "default_s3_bucket" {
    bucket = "${var.vpc_name}_bucket"
    acl = "private"

    tags {
        Name = "${var.vpc_name}_bucket"
        Environment = "prod"
    }
}

/* S3 bucket for elb logs */
resource "aws_s3_bucket" "default_s3_log_bucket" {
    bucket = "${var.vpc_name}_log_bucket"
    acl = "log-delivery-write"

    tags {
        Name = "${var.vpc_name}_log_bucket"
        Environment = "prod"
    }
}

