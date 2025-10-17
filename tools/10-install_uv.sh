#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Install uv
curl -LsSf https://astral.sh/uv/install.sh -o /tmp/install_uv.sh
cat /tmp/install_uv.sh | bash
# source $HOME/.local/bin/env

# To enable shell autocompletion for uv commands, run one of the following:
echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
echo 'eval "$(uvx --generate-shell-completion bash)"' >> ~/.bashrc
# echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
# echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc