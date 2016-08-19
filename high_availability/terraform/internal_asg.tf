variable "default_max" {
  description = "Maxmimum instance count"
  default = 6
}

variable "default_min" {
  description = "Minimum instance count"
  default     = 2
}

variable "default_desired" {
  description = "Desired instance count"
  default     = 2
}

resource "aws_autoscaling_group" "default_autoscaling_group_private" {
  vpc_zone_identifier =  ["${aws_subnet.default_subnet_one_private.id}", "${aws_subnet.default_subnet_two_private.id}"]
  name = "${var.vpc_name}-private-asg"
  max_size = "${var.default_max}"
  min_size = "${var.default_min}"
  desired_capacity = "${var.default_min}"

  health_check_grace_period = 300
  health_check_type = "ELB"
  launch_configuration = "${aws_launch_configuration.default_launch_config_private.name}"
  load_balancers = ["${aws_elb.default_elb_internal.name}"]
  termination_policies = [ "OldestInstance", "OldestLaunchConfiguration", "Default" ]

  tag {
    key = "Name"
    value = "${var.vpc_name}-private-web-server"
    propagate_at_launch = "true"
  }
}

resource "aws_launch_configuration" "default_launch_config_private" {
  name = "${var.vpc_name}-private-lg"
  image_id = "${var.public_app_server_amazon_linux_ami}"
  instance_type = "${var.public_app_server_instance_type}"
  security_groups = ["${aws_security_group.default_internal_sg.id}"]
  user_data = "${file("cloud-config/init.sh")}"
  key_name = "${var.vpc_name}-keypair"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "default_autoscaling_policy_scale_up_private" {
  name = "${var.vpc_name}-default-scale-up-${var.environment}-private"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.default_autoscaling_group_private.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "default_autoscaling_policy_scale_down_private" {
  name = "${var.vpc_name}-default-scale-down-${var.environment}-private"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 180
  autoscaling_group_name = "${aws_autoscaling_group.default_autoscaling_group_private.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_metric_alarm" "default_autoscaling_policy_cpu_up_private" {
    alarm_name = "${var.vpc_name}__cpu_down_${var.environment}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "70"
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.default_autoscaling_group_private.name}"
    }
    alarm_description = "This metric monitor ec2 cpu utilization"
    alarm_actions = ["${aws_autoscaling_policy.default_autoscaling_policy_scale_up_private.arn}"]

   lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_metric_alarm" "default_autoscaling_policy_cpu_down_private" {
    alarm_name = "${var.vpc_name}_cpu_down_${var.environment}"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "4"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "30"
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.default_autoscaling_group_private.name}"
    }
    alarm_description = "This metric monitor ec2 cpu utilization"
    alarm_actions = ["${aws_autoscaling_policy.default_autoscaling_policy_scale_down_private.arn}"]
  lifecycle {
    create_before_destroy = true
  }
}
