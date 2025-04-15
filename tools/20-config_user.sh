#!/bin/bash
# This script creates a new user with SSH key-based authentication and sudo privileges. Custom username can be provided as an argument, otherwise it defaults to "automator".
# It also disables password authentication for the new user and sets up the SSH directory with the public key from the current user.

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Define variables
USERNAME="${1:-automator}"
HOME_DIR="/home/$USERNAME"

# Create user with home directory but disabled password
echo "Creating user $USERNAME..."
useradd -m -d "$HOME_DIR" -s /bin/bash "$USERNAME"

# Disable password authentication
echo "Disabling password authentication for $USERNAME..."
passwd -l "$USERNAME"

# Create .ssh directory in user's home
echo "Setting up SSH directory..."
mkdir -p "$HOME_DIR/.ssh"

# Copy the current user's public key
if [ -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo "Copying public key from current user..."
    cat "$HOME/.ssh/id_rsa.pub" > "$HOME_DIR/.ssh/authorized_keys"
elif [ -f "$HOME/.ssh/authorized_keys" ]; then
    echo "Copying public key from current user..."
    cat "$HOME/.ssh/authorized_keys" > "$HOME_DIR/.ssh/authorized_keys"
else
    echo "No public key found for the current user. Please manually add a public key."
fi

# Set proper permissions for SSH files
chmod 700 "$HOME_DIR/.ssh"
chmod 600 "$HOME_DIR/.ssh/authorized_keys"
chown -R "$USERNAME:$USERNAME" "$HOME_DIR/.ssh"

# Add user to sudo group
echo "Adding $USERNAME to sudo group..."
usermod -aG sudo "$USERNAME"

# Final message
echo "User $USERNAME created successfully with:"
echo "- Home directory: $HOME_DIR"
echo "- Password authentication: Disabled"
echo "- SSH key-based authentication: Configured (if keys were available)"
echo "- Sudo privileges: Enabled"
echo ""
echo "The user can now log in via SSH with their private key and use sudo for administrator privileges."