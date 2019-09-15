#!/bin/bash

# export go env
export GOPATH=/home/ubuntu/go
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:/bin

source /home/ubuntu/.bashrc

git clone https://github.com/jpmorganchase/quorum.git
cd quorum
make all
