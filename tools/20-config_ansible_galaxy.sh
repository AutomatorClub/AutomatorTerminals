#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

ansible-galaxy collection install community.docker
ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install microsoft.ad
