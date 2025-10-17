#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Install stable version (default)
curl -fsSL https://claude.ai/install.sh | bash

# Install latest version
# curl -fsSL https://claude.ai/install.sh | bash -s latest
