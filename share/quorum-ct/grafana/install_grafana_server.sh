#!/bin/bash

# install debian common
sudo apt-get install -y software-properties-common

# add PPA
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb beta main"

# GPG validation
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

# apt update
sudo apt-get update

# apt install grafana
sudo apt-get install -y grafana

# setup monit
sudo cp /tmp/grafana__etc__monit__conf.d__grafana-server /etc/monit/conf.d/grafana-server

# clean-up
rm -rf /tmp/prometheus*
