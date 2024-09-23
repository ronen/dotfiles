#!/usr/bin/bash

function find_brew() {
    # Define standard installation locations for Homebrew
    local brew_locations=(
        "/usr/local/bin/brew"       # Common macOS location for Intel
        "/opt/homebrew/bin/brew"    # Common macOS location for Apple Silicon
        "/home/linuxbrew/.linuxbrew/bin/brew"  # Typical Linux location
        "/usr/bin/brew"             # Sometimes exists on Linux or macOS
    )

    # Loop through the defined locations and check if brew exists
    for brew_path in "${brew_locations[@]}"; do
        if [ -f "$brew_path" ]; then
            echo "$brew_path"
            return
        fi
    done

    # Return an empty string if brew is not found
    echo ""
}

if ! command -v highlight >/dev/null 2>&1; then 
    brew=$(find_brew)
    if [ -n "$brew" ]; then
	$brew install highlight
    fi
fi
