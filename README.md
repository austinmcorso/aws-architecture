# AWS Architecture

Purpose: Automate a High Availability Web Application environment within the AWS infrastructure.

## Network

- VPC
- Internet Gateway
- Route tables (public and private)
- Private subnets
- Public subnets

## EC2

- NAT server on public subnet - gateway for systems on private network http, https (inbound/outbound)
- OpenVPN server on public subnet(s)
- AutoScale Group (desired 3, min 3, max 6) internal / public

## Infrastructure

- ElasticCache (memcache)
- Elastic File System
- Elastic Load Balancer (public and internal)
- RDS Multi AZ (mariadb)
- S3

## Security

- security group for public servers
- security group for internal network
- security group for NAT
- security group for RDS

## Tools
The following tools are being used to provision our AWS Architecture.

- Terraform - used to create AWS environment
- Ansible - used to provision systems on startup using ansible-pull

