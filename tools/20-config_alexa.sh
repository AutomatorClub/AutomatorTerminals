#!/bin/bash

# Check for debian OS
source /etc/os-release
if [[ "${ID}" != "debian" ]]; then
    echo "This is not Debian system. Terminate script execution."
    exit
fi

# export NOTIFYME="your_access_code_here" # Set your NotifyMe access code here https://www.thomptronics.com/about/notify-me

mkdir -p ~/.aliases
cp -rf .aliases/notify_alexa ~/.aliases/

# Append to shell configuration files to ensure persistence across sessions
ALIASES_FILES=(
    "$HOME/.bash_aliases"
)

for aliases_file in "${ALIASES_FILES[@]}"; do
    if [ -f "$aliases_file" ]; then
        # Remove any existing source lines for the specific aliases file
        sed -i "\|source ~/.aliases/notify_alexa|d" "$aliases_file"
        
        # Add the source line
        echo "source ~/.aliases/notify_alexa" >> "$aliases_file"
    fi
done

bash