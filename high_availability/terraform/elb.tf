# Create a elastic load balancer
resource "aws_elb" "default_elb" {
  name = "${var.vpc_name}-elb"
  security_groups = [
    "${aws_security_group.default_public_servers_sg.id}"
  ]
  subnets = [
    "${aws_subnet.10010_us_east_1a_public.id}",
    "${aws_subnet.10020_us_east_1b_public.id}"
  ]

  listener {
    instance_port = 8000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:8000/"
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

  tags {
    Name = "${var.vpc_name}-elb"

  }
}
