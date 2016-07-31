#!/bin/bash

# Install aws cli
easy_install pip
pip install awscli

# Install Terrform
cd /usr/local/bin
unzip /vagrant/terraform_0.6.16_linux_amd64.zip
