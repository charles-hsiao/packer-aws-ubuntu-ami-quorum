#!/bin/bash

P_VERSION=2.13.0

# clone Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v$P_VERSION/prometheus-$P_VERSION.linux-amd64.tar.gz

# unzip 
tar -xvzf prometheus-$P_VERSION.linux-amd64.tar.gz

# Prometheus data store
# mkdir -p data

# create & copy files
sudo mkdir -p ~/prometheus
sudo mv ~/prometheus-$P_VERSION.linux-amd64/* ~/prometheus/
sudo cp /tmp/prometheus__etc__init.d__prometheus /etc/init.d/prometheus

# update init config permission
sudo chmod 755 /etc/init.d/prometheus

# setup monit
sudo cp /tmp/prometheus__etc__monit__conf.d__prometheus /etc/monit/conf.d/prometheus

# clean-up
rm -f ~/prometheus-2.13.0.linux-amd64.tar.gz
rm -rf ~/prometheus-2.13.0.linux-amd64
rm -rf /tmp/prometheus*