#!/bin/bash
set -e

echo "=== Dog Photos App - Interview Setup ==="
echo ""

# 1. Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "WARNING: Xcode does not appear to be installed."
    echo "Please install Xcode from the App Store before continuing."
    echo ""
else
    XCODE_VERSION=$(xcodebuild -version | head -n1)
    echo "Found $XCODE_VERSION"
fi

# 2. Install or verify Claude Code CLI
if command -v claude &> /dev/null; then
    echo "Claude Code CLI is already installed: $(claude --version 2>/dev/null || echo 'unknown version')"
else
    echo "Claude Code CLI not found. Installing..."
    curl -fsSL https://claude.ai/install.sh | bash

    # Source profile so claude is available in this session
    for rc in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.bash_profile" "$HOME/.profile"; do
        [ -f "$rc" ] && source "$rc" 2>/dev/null
    done

    if ! command -v claude &> /dev/null; then
        echo "ERROR: Claude Code CLI installation failed or is not on PATH."
        echo "Try restarting your terminal and running this script again."
        exit 1
    fi
    echo "Claude Code CLI installed successfully."
fi

# 3. Authenticate with provided token
echo ""
echo "=== Claude Code Authentication ==="
echo ""

if [ -n "$1" ]; then
    API_KEY="$1"
    echo "Using API key provided as argument."
else
    echo "Please enter your Anthropic API key (provided by your interviewer):"
    read -rs API_KEY
    echo ""
fi

if [ -z "$API_KEY" ]; then
    echo "ERROR: No API key provided. Usage:"
    echo "  ./setup.sh <your-api-key>"
    echo "  or run ./setup.sh and paste it when prompted."
    exit 1
fi

# Write key to .env so it persists for the session
echo "ANTHROPIC_API_KEY=$API_KEY" > .env

# Export for current session
export ANTHROPIC_API_KEY="$API_KEY"

echo "API key configured."
echo ""
echo "=== Setup Complete ==="
echo ""
echo "To start working:"
echo "  1. Open DogPhotosApp.xcodeproj in Xcode"
echo "  2. Run: source .env && claude"
echo "     (or: ANTHROPIC_API_KEY=$API_KEY claude)"
echo ""
echo "Good luck!"
