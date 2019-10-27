#!/bin/bash

# reload monit
sudo monit reload

# htop installation
sudo apt-get install -y htop

# clone ansible playbooks
git clone https://github.com/charles-hsiao/quorum-ansible-playbooks.git

# execute ansible init.sh
cd /home/ubuntu/quorum-ansible-playbooks
bash init.sh
