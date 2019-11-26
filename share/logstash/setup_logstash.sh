#!/bin/bash

# Install packages of htop
sudo apt-get install -y htop

# setup monit
sudo cp /tmp/logstash__etc__monit__conf.d__logstash /etc/monit/conf.d/logstash
