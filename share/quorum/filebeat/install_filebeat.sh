#!/bin/bash

FILEBEAT_VERSION=7.4.2

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FILEBEAT_VERSION-amd64.deb
sudo dpkg -i filebeat-$FILEBEAT_VERSION-amd64.deb
rm filebeat-$FILEBEAT_VERSION-amd64.deb

# replace systemd config
sudo rm /lib/systemd/system/filebeat.service
sudo cp /tmp/filebeat__lib__systemd__system__filebeat.service /lib/systemd/system/filebeat.service
sudo chmod 0644 /lib/systemd/system/filebeat.service

# clean-up
rm -rf /tmp/filebeat*
