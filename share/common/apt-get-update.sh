#!/bin/bash

set -ex

sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
# Ignore interactive mode
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
