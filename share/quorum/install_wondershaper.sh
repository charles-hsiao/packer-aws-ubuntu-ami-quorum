#!/bin/bash

# install zip
sudo apt-get install -y zip


# install wondershaper
wget https://github.com/magnific0/wondershaper/archive/master.zip -c -O wondershaper-tmp.zip 
unzip -o wondershaper-tmp.zip 
rm wondershaper-tmp.zip 
cd wondershaper-master 
sudo make install
cd .. 
rm -rf wondershaper-master
