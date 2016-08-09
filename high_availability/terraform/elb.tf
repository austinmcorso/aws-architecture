/* High Availability ELB environment */
# Create a elastic load balancer
resource "aws_elb" "default_elb" {
  name = "${var.vpc_name}-elb"
  security_groups = [
    "${aws_security_group.default_public_servers_sg.id}"
  ]
  subnets = [
    "${aws_subnet.default_subnet_one_public.id}",
    "${aws_subnet.default_subnet_two_public.id}"
  ]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  instances = [
    "${aws_instance.web_one_public_server.*.id}",
    "${aws_instance.web_two_public_server.*.id}"
  ]

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  # TODO: Create access policy for logging to S3
  #access_logs {
  #  bucket = "${var.vpc_name}_log_bucket"
  #}

  tags {
    Name = "${var.vpc_name}-elb"

  }
}

/* setup stickiness */
resource "aws_lb_cookie_stickiness_policy" "default_lb_cookie_stickiness_policy" {
      name = "${var.vpc_name}-lbpolicy"
      load_balancer = "${aws_elb.default_elb.id}"
      lb_port = 80
      cookie_expiration_period = 600
}

resource "aws_elb" "default_elb_internal" {
  name = "${var.vpc_name}-int-elb"
  security_groups = [
    "${aws_security_group.default_public_servers_sg.id}"
  ]
  subnets = [
    "${aws_subnet.default_subnet_one_private.id}",
    "${aws_subnet.default_subnet_two_private.id}"
  ]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  # TODO: managed via asg
  #instances = [
  #  "${aws_instance.web_one_public_server.*.id}",
  #  "${aws_instance.web_two_public_server.*.id}"
  #]

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  # TODO: Create access policy for logging to S3
  #access_logs {
  #  bucket = "${var.vpc_name}_log_bucket"
  #}

  tags {
    Name = "${var.vpc_name}-elb"

  }
}

output "public_elb" {
    value = "${aws_elb.default_elb.id}"
}

output "internal_elb" {
    value = "${aws_elb.default_elb_internal.id}"
}
