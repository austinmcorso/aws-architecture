# AWS Architecture

The goal - automate AWS infrastructure.

## Network

- VPC
- Internet Gateway
- Route tables (public and private)
- Private subnets
- Public subnets

## EC2

- NAT server on public subnet - gateway for systems on private network http, https (inbound/outbound)
- OPenVPN server on public subnet

## Infrastructure

- ElasticCache (memcache)
- Elastic File System
- Elastic Load Balancer
- RDS
- S3

## Security

- security group for public servers
- security group for internal network
- security group for NAT
- security group for RDS

## Tools
The following tools are being used to provision our AWS Architecture.

- Terraform
- Ansible

