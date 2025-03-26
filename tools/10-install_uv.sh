#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Install uv
curl -LsSf https://astral.sh/uv/install.sh -o /tmp/install_uv.sh | bash
source $HOME/.local/bin/env