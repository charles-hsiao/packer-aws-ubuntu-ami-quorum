#!/bin/bash

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# install docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# issue fix
sudo pip uninstall -y urllib3
sudo pip install urllib3==1.22

# clone epirus-free
git clone https://github.com/blk-io/epirus-free.git

# create & copy files
sudo cp /tmp/epirus__etc__init.d__epirus /etc/init.d/epirus

# update init config permission
sudo chmod 755 /etc/init.d/epirus

# setup monit
sudo cp /tmp/epirus__etc__monit__conf.d__epirus /etc/monit/conf.d/epirus

# clean-up
rm -rf /tmp/epirus*
