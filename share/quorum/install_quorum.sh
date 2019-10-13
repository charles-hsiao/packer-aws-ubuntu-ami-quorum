#!/bin/bash

# export go env
#export GOPATH=/home/ubuntu/go
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:/bin

#source /home/ubuntu/.bashrc

#git clone https://github.com/jpmorganchase/quorum.git
#cd quorum
#make all

set -eu -o pipefail

sudo apt-get update
packages=(
    parallel        # utility
    unzip           # tessera startup script dependency
    default-jdk     # tessera runtime dependency
    libleveldb-dev  # constellation dependency
    libsodium-dev   # constellation dependency
)
sudo apt-get install -y ${packages[@]}

CVER="0.3.2"
CREL="constellation-$CVER-ubuntu1604"
CONSTELLATION_OUTPUT_FILE="constellation.tar.xz"
POROSITY_OUTPUT_FILE="/usr/local/bin/porosity"

TESSERA_HOME=/home/ubuntu/tessera
mkdir -p ${TESSERA_HOME}
TESSERA_VERSION="0.10.0"
TESSERA_OUTPUT_FILE="${TESSERA_HOME}/tessera.jar"
TESSERA_ENCLAVE_OUTPUT_FILE="${TESSERA_HOME}/enclave.jar"

QUORUM_VERSION="2.2.5"
QUORUM_OUTPUT_FILE="geth.tar.gz"

# download binaries in parallel
echo "Downloading binaries ..."
sudo parallel --link wget -q -O ::: \
    ${CONSTELLATION_OUTPUT_FILE} \
    ${TESSERA_OUTPUT_FILE} \
    ${TESSERA_ENCLAVE_OUTPUT_FILE} \
    ${QUORUM_OUTPUT_FILE} \
    ${POROSITY_OUTPUT_FILE} \
    ::: \
    https://github.com/jpmorganchase/constellation/releases/download/v$CVER/$CREL.tar.xz \
    https://oss.sonatype.org/content/groups/public/com/jpmorgan/quorum/tessera-app/${TESSERA_VERSION}/tessera-app-${TESSERA_VERSION}-app.jar \
    https://oss.sonatype.org/content/groups/public/com/jpmorgan/quorum/enclave-jaxrs/${TESSERA_VERSION}/enclave-jaxrs-${TESSERA_VERSION}-server.jar \
    https://dl.bintray.com/quorumengineering/quorum/v${QUORUM_VERSION}/geth_v${QUORUM_VERSION}_linux_amd64.tar.gz \
    https://github.com/jpmorganchase/quorum/releases/download/v1.2.0/porosity

# install constellation
echo "Installing Constellation ${CVER}"
tar xfJ ${CONSTELLATION_OUTPUT_FILE}
sudo cp ${CREL}/constellation-node /usr/local/bin && sudo chmod 0755 /usr/local/bin/constellation-node
rm -rf ${CREL}
rm -f ${CONSTELLATION_OUTPUT_FILE}

# install tessera
echo "Installing Tessera ${TESSERA_VERSION}"
echo "TESSERA_JAR=${TESSERA_OUTPUT_FILE}" >> /home/ubuntu/.profile
echo "ENCLAVE_JAR=${TESSERA_ENCLAVE_OUTPUT_FILE}" >> /home/ubuntu/.profile

# install Quorum
echo "Installing Quorum ${QUORUM_VERSION}"
sudo tar xfz ${QUORUM_OUTPUT_FILE} -C /usr/local/bin
rm -f ${QUORUM_OUTPUT_FILE}

# install Porosity
echo "Installing Porosity"
sudo chmod 0755 ${POROSITY_OUTPUT_FILE}

# copy examples
git clone https://github.com/jpmorganchase/quorum-examples.git

#cp -r /ubuntu/examples /home/ubuntu/quorum-examples
#chown -R ubuntu:ubuntu /home/ubuntu/quorum-examples

# from source script
#cp /ubuntu/go-source.sh /home/ubuntu/go-source.sh
#chown ubuntu:ubuntu /home/ubuntu/go-source.sh

