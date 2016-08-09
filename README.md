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

## Setup Openvpn
ssh to one of the public openvpn servers.

ssh hostname -i keypair.pem -l openvpnas

type: yes

accept default value for everything else.

add your licence key.

Change the password for the openvpn user

sudo passwd openvpn (openvpn/openvpn)

open openvpn client install https://public-ipaddress connect to download client if you don't already have it installed.

- connect to public ipaddress
- click yes for both dialogs

Navigate to https://public-ipaddress/admin

- click advance
- click proceed to..
- username: openvpn
- password: openvpn
- click Agree
- Click "Server Network Settings" and scroll down and deselect "Admin Web Server" and "Client Web Server" then click "Save Settings"
- Click "Update Running Server"
- This should break things for a moment.
- Navigigate to https://your-privateip::943/admin and click "Advanced" and Proceed to ...
- username: openvpn
- password: openvpn

Now lets test network.

##Elk stack

By default, the stack exposes the following ports:

- 5000: Logstash TCP input. - Add some test data.

```bash
nc localhost 5000 < /var/log/messages
nc localhost 5000 < /var/log/maillog
nc localhost 5000 < /var/log/secure
nc localhost 5000 < /var/log/spooler
nc localhost 5000 < /var/log/yum.log
nc localhost 5000 < /var/log/lastlog
nc localhost 5000 < /var/log/cloud-init-output.log
nc localhost 5000 < /var/log/cloud-init.log
```

- 5601: Kibana - connect to one of the XXX-elkXX-private-servers i.e. http://server.ip.address:5601/

##Utility Server
Connect to Jenkins instance

- http://server.ip.address:8080/ (follow instruction to complete install)

Connect to the Selenium Hub Console

- http://server.ip.address:4444/