#!/bin/bash

# Path to store persistent environment variable
ENV_FILE="$HOME/.env"

# Function to validate name (ensure it's not empty and contains at least two characters)
validate_name() {
    local name="$1"
    
    # Check if name is not empty and has at least two characters
    if [[ -n "$name" && ${#name} -ge 2 ]]; then
        return 0  # Valid name
    else
        return 1  # Invalid name
    fi
}

# Check if the persistent env file exists and source it
if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
    chmod 600 "$ENV_FILE"
fi

# Check if AUTOMATOR_NAME is set
if [ -z "$AUTOMATOR_NAME" ]; then
    while true; do
        read -p "AUTOMATOR_NAME is not set. Please enter your full name: " input_name
        
        # Validate the input name
        if validate_name "$input_name"; then
            # Save to persistent environment file
            # Use >> to append if other variables might exist
            if grep -q "export AUTOMATOR_NAME=" "$ENV_FILE" 2>/dev/null; then
                # If line exists, replace it
                sed -i "s|export AUTOMATOR_NAME=.*|export AUTOMATOR_NAME=\"$input_name\"|" "$ENV_FILE"
            else
                # If line doesn't exist, append it
                echo "export AUTOMATOR_NAME=\"$input_name\"" >> "$ENV_FILE"
            fi
            
            # Source the file to set the current session's environment
            source "$ENV_FILE"
            
            break
        else
            echo "Invalid name. Please enter at least two characters."
        fi
    done
fi

# Append to shell configuration files to ensure persistence across sessions
SHELL_FILES=(
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.bash_profile"
)

for shell_file in "${SHELL_FILES[@]}"; do
    if [ -f "$shell_file" ]; then
        # Remove any existing source lines for the specific env file
        sed -i "\|source $ENV_FILE|d" "$shell_file"
        
        # Add the source line
        echo "source $ENV_FILE" >> "$shell_file"
    fi
done

echo "Automator Name set successfully: $AUTOMATOR_NAME"
echo "Name persistently stored in $ENV_FILE"