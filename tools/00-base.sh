#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Script to install Base packages
sudo apt update

# Those are more stanalone tools that do not need post configurations and are tiny in size
sudo apt install -y \
    jq \
    yq \
    curl \
    unzip \
    sudo
