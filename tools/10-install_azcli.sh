#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# One liner installation
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Bicep installation
az bicep install
az bicep version