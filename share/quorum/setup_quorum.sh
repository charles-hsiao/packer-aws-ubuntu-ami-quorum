#!/bin/bash

# Install packages of htop & jq
sudo apt-get install -y htop jq

# Install sysbench
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
sudo apt-get -y install sysbench
