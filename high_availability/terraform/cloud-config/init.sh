#!/bin/bash
ANSIBLE_PULL=/opt/ansible/bin/ansible-pull
ANSIBLE_PULL_REPO=https://github.com/chaunceyt/ansible-playbooks.git
ANSIBLE_PULL_BRANCH=lightning
yum -y install git

cd /opt
git clone git://github.com/ansible/ansible.git --recursive
source /opt/ansible/hacking/env-setup
echo "localhost" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
${ANSIBLE_PULL}  -C $ANSIBLE_PULL_BRANCH -U $ANSIBLE_PULL_REPO
