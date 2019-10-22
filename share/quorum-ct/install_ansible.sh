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
