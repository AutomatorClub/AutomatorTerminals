#!/bin/bash

source 00-prompt_email.sh

# Check if AUTOMATOR_EMAIL is set
if [ -n "${AUTOMATOR_EMAIL}" ]; then
    # Ensure .ssh directory exists
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh

    # Generate SSH private key with the email
    ssh-keygen -t ed25519 -C "$AUTOMATOR_EMAIL" -f ~/.ssh/id_rsa -N ""

    # Set proper permissions for the key
    chmod 600 ~/.ssh/id_rsa
    chmod 644 ~/.ssh/id_rsa.pub

    echo "SSH key generated successfully for $AUTOMATOR_EMAIL"
    echo "Private key location: ~/.ssh/id_rsa"
    echo "Public key location: ~/.ssh/id_rsa.pub"
    echo "Public key content:" && cat ~/.ssh/id_rsa.pub
fi
