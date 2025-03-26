#!/bin/bash
# Script to install Base packages
sudo apt update

sudo apt install -y \
    git 

# git config --global user.name "Sammy"
# git config --global user.email "sammy@domain.com"

# Configure Git to ensure line endings in files you checkout are correct for Linux
# git config --global core.autocrlf input
 