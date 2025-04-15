#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Install node
# Script to install npm and nodejs latest version
sudo apt remove libnode-dev -y
sudo apt update
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt update
sudo apt-get install -y nodejs
sudo npm install -g npm@latest
