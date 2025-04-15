#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

#!/bin/bash
# Script to install base packages robustly

# Function to check if user is root
is_root() {
    if [ "$(id -u)" -eq 0 ]; then
        return 0  # User is root
    else
        return 1  # User is not root
    fi
}

# Function to install packages
install_packages() {
    local cmd_prefix=""
    
    # Determine whether to use sudo or not
    if ! is_root; then
        echo "Running as non-root user, using sudo for operations"
        cmd_prefix="sudo "
    else
        echo "Running as root user, no sudo needed"
    fi
    
    echo "Updating package lists..."
    ${cmd_prefix}apt update || {
        echo "ERROR: Failed to update package lists"
        exit 1
    }
    
    echo "Installing base packages..."
    ${cmd_prefix}apt install -y \
        jq \
        yq \
        curl \
        unzip \
        sudo || {
        echo "ERROR: Failed to install one or more packages"
        exit 2
    }
    
    echo "All packages installed successfully!"
}

# Main script execution
install_packages