#!/bin/bash

# create aws config path
mkdir -p ~/.aws

# copy credentials
sudo cp /tmp/aws__home__USER__.aws__credentials ~/.aws/credentials

# clean-up
rm -rf /tmp/aws*
