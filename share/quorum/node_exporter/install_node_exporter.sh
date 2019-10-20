#!/bin/bash

EXPORTER_VERSION=0.18.1

# clone node_exportor
wget https://github.com/prometheus/node_exporter/releases/download/v$EXPORTER_VERSION/node_exporter-$EXPORTER_VERSION.linux-amd64.tar.gz

# unzip
tar -xvzf node_exporter-$EXPORTER_VERSION.linux-amd64.tar.gz

# create config file path
sudo mkdir -p /etc/default
sudo mkdir -p /etc/init.d

# create & copy files
mkdir -p ~/node_exporter
sudo mv ~/node_exporter-$EXPORTER_VERSION.linux-amd64/* ~/node_exporter/
sudo cp /tmp/node_exporter__etc__default__node_exporter /etc/default/node_exporter
sudo cp /tmp/node_exporter__etc__init.d__node_exporter /etc/init.d/node_exporter

# update default value permission
sudo chmod 644 /etc/default/node_exporter

# update init config permission
sudo chmod 755 /etc/init.d/node_exporter

# setup monit
sudo cp /tmp/node_exporter__etc__monit__conf.d__node_exporter /etc/monit/conf.d/node_exporter

# clean-up
rm -f node_exporter-0.18.1.linux-amd64.tar.gz
rm -rf node_exporter-0.18.1.linux-amd64
rm -rf /tmp/node_exporter*
