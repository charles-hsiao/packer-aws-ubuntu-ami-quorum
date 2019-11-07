#!/bin/bash

# create & copy files
sudo cp /tmp/grok_exporter-0.2.8.linux-amd64.zip /home/ubuntu/grok_exporter-0.2.8.linux-amd64.zip

# unzip
unzip /home/ubuntu/grok_exporter-0.2.8.linux-amd64.zip

# rename folder
mv grok_exporter-0.2.8.linux-amd64.zip grok_exporter

# create & copy files
sudo cp /tmp/grok_exporter__etc__init.d__grok_exporter /etc/init.d/grok_exporter

# update init config permission
sudo chmod 755 /etc/init.d/grok_exporter

# setup monit
sudo cp /tmp/grok_exporter__etc__monit__conf.d__grok_exporter /etc/monit/conf.d/grok_exporter

# clean-up
rm -rf /tmp/grok_exporter*
