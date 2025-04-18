#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

source 10-install_node.sh

mkdir -p ~/.local/bin
source ~/.profile

# Download latest fabric binary
curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 > ~/.local/bin/fabric && chmod +x ~/.local/bin/fabric && fabric --version

# Download patterns
fabric -U

# config in ~/.config/fabric/.env
# DEFAULT_VENDOR=Gemini
# DEFAULT_MODEL=gemini-2.5-pro-exp-03-25
# PATTERNS_LOADER_GIT_REPO_URL=https://github.com/danielmiessler/fabric.git
# PATTERNS_LOADER_GIT_REPO_PATTERNS_FOLDER=patterns
# PROMPT_STRATEGIES_GIT_REPO_URL=https://github.com/danielmiessler/fabric.git
# PROMPT_STRATEGIES_GIT_REPO_STRATEGIES_FOLDER=strategies
# GEMINI_API_KEY=
# OLLAMA_API_URL=http://localhost:11434
# ANTHROPIC_API_BASE_URL=https://api.anthropic.com/
# ANTHROPIC_API_KEY=
# YOUTUBE_API_KEY=

mkdir -p ~/.aliases
cp -rf .aliases/fabric_patterns ~/.aliases/
cp -rf .aliases/fabric_yt ~/.aliases/

# Append to shell configuration files to ensure persistence across sessions
ALIASES_FILES=(
    "$HOME/.bash_aliases"
)

for aliases_file in "${ALIASES_FILES[@]}"; do
    if [ -f "$aliases_file" ]; then
        # Remove any existing source lines for the specific aliases file
        sed -i "\|source ~/.aliases/fabric_patterns|d" "$aliases_file"
        sed -i "\|source ~/.aliases/fabric_yt|d" "$aliases_file"
        
        # Add the source line
        echo "source ~/.aliases/fabric_patterns" >> "$aliases_file"
        echo "source ~/.aliases/fabric_yt" >> "$aliases_file"
    fi
done

bash