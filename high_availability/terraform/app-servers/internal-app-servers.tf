/* Development server one */
resource "aws_instance" "web_develop_one_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/develop.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-develop01-private-server"
        Environment = "develop"
    }
}

/* UAT server one */
resource "aws_instance" "web_uat_one_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_one_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/uat.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}",
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-uat01-private-server"
        Environment = "uat-stage"
    }
}

/* Development server two */
resource "aws_instance" "web_develop_two_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/develop.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-develop02-private-server"
        Environment = "develop"
    }
}

/* UAT server two */
resource "aws_instance" "web_uat_two_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/uat.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-uat02-private-server"
        Environment = "uat-stage"
    }
}

/* Utility server one */
resource "aws_instance" "utility_one_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/devcloud.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-utility01-private-server"
        Environment = "ci"
    }
}

/* Utility server two */
resource "aws_instance" "utility_two_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/devcloud.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-utility02-private-server"
        Environment = "ci"
    }
}

/* ELK server one */
resource "aws_instance" "elk_one_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/elk.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-elk01-private-server"
        Environment = "logging"
    }
}

/* ELK server two */
resource "aws_instance" "elk_two_private_server" {
    depends_on = ["aws_db_instance.default_rds"]
    ami = "${var.public_app_server_amazon_linux_ami}"
    count = "1"
    subnet_id = "${aws_subnet.default_subnet_two_private.id}"
    instance_type = "${var.public_app_server_instance_type}"
    key_name = "${var.vpc_name}-keypair"
    user_data = "${file("cloud-config/elk.sh")}"
    security_groups = [
      "${aws_security_group.default_internal_sg.id}"
      "${aws_security_group.default_security_group_from_bastion_sg.id}"
      ]
    tags {
        Name = "${var.vpc_name}-elk02-private-server"
        Environment = "logging"
    }
}

