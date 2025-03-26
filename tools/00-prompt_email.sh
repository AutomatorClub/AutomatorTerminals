#!/bin/bash

# Function to validate email format
validate_email() {
    local email="$1"
    local email_regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"
    
    if [[ $email =~ $email_regex ]]; then
        return 0  # Valid email
    else
        return 1  # Invalid email
    fi
}

# Path to store persistent environment variable
ENV_FILE="$HOME/.env"

# Check if the persistent env file exists and source it
if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
    chmod 600 "$ENV_FILE"
fi

# Check if AUTOMATOR_EMAIL is set
if [ -z "$AUTOMATOR_EMAIL" ]; then
    while true; do
        read -p "AUTOMATOR_EMAIL is not set. Please enter a valid email address: " input_email
        
        # Validate the input email
        if validate_email "$input_email"; then
            # Save to persistent environment file
            echo "export AUTOMATOR_EMAIL=\"$input_email\"" > "$ENV_FILE"
            
            # Source the file to set the current session's environment
            source "$ENV_FILE"
            
            break
        else
            echo "Invalid email format. Please try again."
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

echo "Automator email: $AUTOMATOR_EMAIL"
echo "Email persistently stored in $ENV_FILE"