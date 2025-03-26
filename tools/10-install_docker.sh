#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

curl -fsSL https://get.docker.com -o get-docker.sh | sudo bash
rm -rf get-docker.sh

sudo apt update
sudo apt install -y docker-compose