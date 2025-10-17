#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# Install stable version (default)
curl -fsSL https://claude.ai/install.sh | bash

# Install latest version
# curl -fsSL https://claude.ai/install.sh | bash -s latest

# use custom coding agent https://www.youtube.com/watch?v=l1uA7pJZoRM
# echo 'export ANTHROPIC_DEFAULT_OPUS_MODEL="glm-4.5-air"' >> ~/.zshrc
# echo 'export ANTHROPIC_DEFAULT_SONNET_MODEL="glm-4.6"' >> ~/.zshrc
# echo 'export ANTHROPIC_DEFAULT_HAIKU_MODEL="glm-4.6"' >> ~/.zshrc
# echo 'export CLAUDE_CODE_SUBAGENT_MODEL="glm-4.5-air"' >> ~/.zshrc
# ANTHROPIC_BASE_URL="" ANTHROPIC_AUTH_TOKEN="" claude