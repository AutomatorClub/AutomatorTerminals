#!/bin/bash
# Script to install Base packages
sudo apt update

sudo apt install -y \
    git \
    jq \
    yq \
    curl \
    unzip \
    sudo -y

# git config --global user.name "Sammy"
# git config --global user.email "sammy@domain.com"