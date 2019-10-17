#!/bin/bash

# AWS Profile
AWS_PROFILE="quorum"

# AWS region:
AWS_REGION=$1

# Ubuntu version:
UBUNTU_VERSION=$2
UBUNTU_VERSION_SHORT=$( echo ${UBUNTU_VERSION} | sed -e 's/\.//g' )

# AMI Volume
AMI_VOLUME=$3

# AMI Arch
AMI_ARCH=$4

# template
TEMPLATE=$5

# Linux or Darwin(MacOS)
DETECTED_OS=$(sh -c 'uname 2>/dev/null || echo Unknown')

echo "========================================="
echo "[DEBUG] UBUNTU_VERSION=${UBUNTU_VERSION}"
echo "[DEBUG] UBUNTU_VERSION_SHORT=${UBUNTU_VERSION_SHORT}"
echo "[DEBUG] AWS_REGION=${AWS_REGION}"
echo "[DEBUG] AMI_VOLUME=${AMI_VOLUME}"
echo "[DEBUG] AMI_ARCH=${AMI_ARCH}"
echo "========================================="

echo "[DEBUG] Start to inspect latest AMI id of official Ubuntu AMI"

AMI_INFO=$( bash cmd/aws-ami-inspect.sh ${DETECTED_OS} ${AWS_REGION} ${UBUNTU_VERSION} ${AMI_VOLUME} ${AMI_ARCH} )
UPSTREAM_UBUNTU_RELEASE=$( echo ${AMI_INFO} | jq --raw-output -c '.UBUNTU_RELEASE' )
UPSTREAM_UBUNTU_AMI=$( echo ${AMI_INFO} | jq --raw-output -c '.AMI_ID' )

echo "[DEBUG] UPSTREAM_UBUNTU_RELEASE=${UPSTREAM_UBUNTU_RELEASE}"
echo "[DEBUG] UPSTREAM_UBUNTU_AMI=${UPSTREAM_UBUNTU_AMI}"

LATEST_GIT_HASH=$( git rev-parse --short HEAD )
echo "[DEBUG] LATEST_GIT_HASH=${LATEST_GIT_HASH}"

env AWS_PROFILE=${AWS_PROFILE} packer build \
  -var "AWS_REGION=${AWS_REGION}" \
  -var "UPSTREAM_UBUNTU_AMI=${UPSTREAM_UBUNTU_AMI}" \
  -var "UPSTREAM_UBUNTU_RELEASE=${UPSTREAM_UBUNTU_RELEASE}" \
  -var "UBUNTU_VERSION_SHORT=${UBUNTU_VERSION_SHORT}" \
  -var "LATEST_GIT_HASH=${LATEST_GIT_HASH}" \
  ${TEMPLATE}
