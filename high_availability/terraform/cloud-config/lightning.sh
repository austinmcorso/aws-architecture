#!/bin/bash
ANSIBLE_PULL=/opt/ansible/bin/ansible-pull
ANSIBLE_PULL_REPO=https://github.com/chaunceyt/ansible-playbooks.git
ANSIBLE_GITHUB_REPO_URL=https://github.com/ansible/ansible.git
ANSIBLE_PULL_BRANCH=lightning

# Update system
yum -y update
yum -y install git

# Checkout Ansible project code.
cd /opt
git clone $ANSIBLE_GITHUB_REPO_URL --recursive

# Setup environment.
source /opt/ansible/hacking/env-setup
echo "localhost" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts

# Provision this host.
${ANSIBLE_PULL}  -C $ANSIBLE_PULL_BRANCH -U $ANSIBLE_PULL_REPO
