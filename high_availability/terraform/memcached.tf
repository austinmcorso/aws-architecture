/* Memcached Cluster on Internal Network */
resource "aws_security_group" "default_memcached_sg" {
  vpc_id = "${aws_vpc.default_vpc.id}"

  tags {
    Name = "${var.vpc_name}-memcached-sg"
  }
}

variable "cache_nodes" {
  default = "1"
}
variable "cache_engine_version" {
  default = "1.4.24"
}
variable "cache_instance_type" {
  default = "cache.t2.micro"
}
variable "cache_maintenance_window" {
  # Sunday 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}

resource "aws_elasticache_cluster" "default_memcached" {
  cluster_id = "${var.memcached_name}"
  engine = "memcached"
  engine_version = "${var.cache_engine_version}"
  maintenance_window = "${var.cache_maintenance_window}"
  node_type = "${var.cache_instance_type}"
  num_cache_nodes = "${var.cache_nodes}"
  parameter_group_name = "default.memcached1.4"
  port = "11211"
  subnet_group_name = "${aws_elasticache_subnet_group.default_elasticache_subnet_group.name}"
  security_group_ids = ["${aws_security_group.default_memcached_sg.id}"]

  tags {
    Name = "${var.vpc_name}-memcache-cluster"
    Environment = "${var.environment}"
  }
}

resource "aws_elasticache_subnet_group" "default_elasticache_subnet_group" {
  name = "${var.vpc_name}-cache-subnet-group"
  description = "Private subnets for the elasticache instances"
  subnet_ids = ["${aws_subnet.default_subnet_one_private.id}", "${aws_subnet.default_subnet_two_private.id}"]
}

output "elasticache_cluster_endpoint" {
    value = "${aws_elasticache_cluster.default_memcached.configuration_endpoint}"
}

