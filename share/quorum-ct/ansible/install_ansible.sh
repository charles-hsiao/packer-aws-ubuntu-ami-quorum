#!/bin/bash

# Install Ansible from PPA

# apt-update
sudo apt-get update

# install common packages
sudo apt-get install -y software-properties-common

# add PPA
sudo apt-add-repository --yes --update ppa:ansible/ansible

# install ansible
sudo apt-get install -y ansible
sudo pip install boto3

# replace ansible config 
sudo rm -r /etc/ansible/ansible.cfg
sudo cp /tmp/ansible__etc__ansible__ansible.cfg /etc/ansible/ansible.cfg 

# add AWS credential into system wide environment variable
sudo bash -c 'cat /tmp/ansible_aws_credential >> /etc/environment'

# clean-up
sudo rm -r /tmp/ansible*
