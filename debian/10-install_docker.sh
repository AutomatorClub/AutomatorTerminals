#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh | sudo bash
rm -rf get-docker.sh

sudo apt update
sudo apt install -y docker-compose