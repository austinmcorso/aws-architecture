/* Default security group */
resource "aws_security_group" "default_sg" {
  name = "${var.vpc_name}-default-sg"
  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  tags { 
    Name = "${var.vpc_name}-default-sg" 
  }
}

/* Security group for the nat server */
resource "aws_security_group" "default_nat_sg" {
  name = "${var.vpc_name}-nat-sg"
  description = "Security group for nat instances that allows SSH and VPN traffic from internet. Also allows outbound HTTP[S]"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.private_subnet_one_cidr}", "${var.private_subnet_two_cidr}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { 
    Name = "${var.vpc_name}-nat-sg" 
  }
}

/* Security group for the public servers */
resource "aws_security_group" "default_public_servers_sg" {
  name = "${var.vpc_name}-public-servers-sg"
  description = "Security group for web that allows web traffic from internet"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { 
    Name = "${var.vpc_name}-public-servers-sg"
  }
}

/* Default internal Security Group */
resource "aws_security_group" "default_internal_sg" {
  name = "${var.vpc_name}_internal_sg"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.default_vpc.id}"

  ingress {
    from_port = 8 
    to_port = 0 
    protocol = "icmp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.vpc_name}_internal_sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "default_security_group_bastion_sg" {
  name = "${var.vpc_name}-bastion-ssh"
  description = "Allow SSH to Bastion host"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.bastion_allow_ip_range}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.default_vpc.id}"
  tags {
      Name = "${var.vpc_name}_bastion_ssh"
  }
}

resource "aws_security_group" "default_security_group_from_bastion_sg" {
  name = "ssh_from_bastion"
  description = "Allow SSH from Bastion host(s)"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.default_security_group_bastion_sg.id}",
      "${aws_security_group.default_nat_sg.id}"
    ]
  }
  vpc_id = "${aws_vpc.default_vpc.id}"
  tags {
      Name = "${var.vpc_name}_ssh_from_bastion"
  }
}
