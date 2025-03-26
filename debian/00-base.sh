#!/bin/bash
# Script to install Base packages
sudo apt update

sudo apt install -y \
    jq \
    yq \
    curl \
    unzip \
    sudo -y
