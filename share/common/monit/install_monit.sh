#!/bin/bash

M_VERSION=5.25.1

# clone monit binary
wget https://mmonit.com/monit/dist/binary/$M_VERSION/monit-$M_VERSION-linux-x64.tar.gz

# unzip & copy to /usr/bin & set permission
tar -vxzf monit-$M_VERSION-linux-x64.tar.gz
sudo cp -f monit-$M_VERSION/bin/monit /usr/bin/monit
sudo chmod 755 /usr/bin/monit

# create config file path
sudo mkdir -p /etc/monit/conf.d
sudo mkdir -p /etc/default

# copy files
sudo cp /tmp/monit/etc_monitrc /etc/monitrc
sudo cp /tmp/monit/etc__default__monit /etc/default/monit
sudo cp /tmp/monit/etc__init.d__monit /etc/init.d/monit

# update default value permission
sudo chmod 644 /etc/default/monit

# update init config permission
sudo chmod 755 /etc/init.d/monit

# update monit config permission
sudo chmod 600 /etc/monitrc

# enable monit service
sudo systemctl enable monit.service

# clean-up 
rm -r monit-$M_VERSION-linux-x64.tar.gz
rm -rf monit-$M_VERSION
rm -rf /tmp/monit

# start monit service
sudo service monit start

