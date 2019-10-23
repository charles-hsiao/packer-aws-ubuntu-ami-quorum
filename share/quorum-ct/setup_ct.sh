#!/bin/bash

# htop installation
sudo apt-get install -y htop

# clone ansible playbooks
git clone https://github.com/charles-hsiao/quorum-ansible-playbooks.git

# provision prometheus config with ansible
ansible-playbook ~/quorum-ansible-playbooks/prometheus/prometheus.yml
