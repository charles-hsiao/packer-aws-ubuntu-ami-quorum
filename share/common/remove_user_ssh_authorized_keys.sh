#!/bin/sh

set -ex

# remove ssh authorized_keys created by packer
rm ~/.ssh/authorized_keys | true
