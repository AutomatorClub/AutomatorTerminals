#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Az packages for powershell
sudo pwsh -C Install-Module Az.Accounts -Repository PSGallery -Force
sudo pwsh -C Install-Module Az.Resources -Repository PSGallery -Force
sudo pwsh -C Install-Module Az.KeyVault -Repository PSGallery -Force
sudo pwsh -C Install-Module -Name powershell-yaml -Force
