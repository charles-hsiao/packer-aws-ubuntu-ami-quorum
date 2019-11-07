#!/bin/bash

# create & copy files
sudo cp /tmp/grok_exporter-0.2.8.linux-amd64.zip /home/ubuntu/grok_exporter-0.2.8.linux-amd64.zip

# unzip
sudo apt-get install -y zip
unzip /home/ubuntu/grok_exporter-0.2.8.linux-amd64.zip

# rename folder
mv /home/ubuntu/grok_exporter-0.2.8.linux-amd64 /home/ubuntu/grok_exporter

# create & copy files
sudo cp /tmp/grok_exporter__etc__init.d__tessera_exporter /etc/init.d/tessera_exporter
sudo cp /tmp/grok_exporter__home__USER__grok_exporter__tessera_exporter.yml /home/ubuntu/grok_exporter/tessera_exporter.yml

# update init config permission
sudo chmod 755 /etc/init.d/tessera_exporter

# setup monit
sudo cp /tmp/grok_exporter__etc__monit__conf.d__grok_exporter /etc/monit/conf.d/grok_exporter

# clean-up
rm -rf /tmp/grok_exporter*
rm -f /home/ubuntu/grok_exporter-0.2.8.linux-amd64.zip
