#!/bin/bash

# Prerequisites
source 10-install_uv.sh

# Install ansible-galaxy
ansible-galaxy collection install azure.azcollection
uv pip install --system  -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt --break-system-packages