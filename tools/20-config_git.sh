#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

source 00-prompt_email.sh

# git config --global user.name "Sammy"
# Check if AUTOMATOR_EMAIL is set
if [ -n "${AUTOMATOR_EMAIL}" ]; then
    git config --global user.email "${AUTOMATOR_EMAIL}"
fi

source 00-prompt_name.sh

# Check if AUTOMATOR_NAME is set
if [ -n "${AUTOMATOR_NAME}" ]; then
    git config --global user.name "${AUTOMATOR_NAME}"
fi

# Configure Git to ensure line endings in files you checkout are correct for Linux
git config --global core.autocrlf input
 