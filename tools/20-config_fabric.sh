#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Download latest fabric binary
curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 > ~/.local/bin/fabric && chmod +x ~/.local/bin/fabric && fabric --version

