#!/usr/bin/env bash

commands=(
    "highlight"
    "direnv"
)

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

brew=$(find_brew)
if [ -n "$brew" ]; then
    for command in "${commands[@]}"; do
        if ! command -v "$command" &> /dev/null; then
            "$brew" install "$command"
        fi
    done
fi
