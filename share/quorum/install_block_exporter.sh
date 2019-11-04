#!/bin/bash

# git clone block-exporter repo
git clone https://github.com/charles-hsiao/block-exporter.git

# create config file path
sudo mkdir -p /etc/init.d

# install packages
sudo pip install -r block-exporter/requirements.txt

# move init config
sudo cp block-exporter/etc/init.d/block_exporter /etc/init.d/block_exporter

# move monit config
sudo cp block-exporter/etc/monit/conf.d/block_exporter /etc/monit/conf.d/block_exporter

# update init config permission
sudo chmod 755 /etc/init.d/block_exporter

