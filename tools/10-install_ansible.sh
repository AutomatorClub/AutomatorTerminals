#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

sudo apt update
sudo apt install -y ansible