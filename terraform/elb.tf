# Create a elastic load balancer
resource "aws_elb" "default_elb" {
  name = "${var.vpc_name}-elb"
  availability_zones = ["us-east-1a", "us-east-1b"]

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

  instances = []
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.vpc_name}-elb"

  }
}
