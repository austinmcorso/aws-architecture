##Internal Application Servers.

- Jenkins
- Selenium Hub
- ELK stack

#Setup

mv internal-app-servers.tf ../
cd ../
terraform plan
terraform apply

Connect to Jenkins instance

http://server.ip.address:8080/ (follow instruction to complete install)

Connect to the Selenium Hub Console

http://server.ip.address:4444/
