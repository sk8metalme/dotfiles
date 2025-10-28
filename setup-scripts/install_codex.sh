#!/bin/bash

# Codex installation and setup script

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_CONFIG_DIR="$HOME/.codex"
CODEX_CONFIG="$CODEX_CONFIG_DIR/config.toml"

echo "Installing and setting up Codex..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    echo "Visit: https://brew.sh/"
    exit 1
fi

# Install Codex via Homebrew
echo "Installing Codex via Homebrew..."
if ! command -v codex &> /dev/null; then
    brew install codex
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Codex. Please check your Homebrew setup."
        exit 1
    fi
else
    echo "Codex is already installed."
fi

# Create .codex directory if it doesn't exist
if [ ! -d "$CODEX_CONFIG_DIR" ]; then
    mkdir -p "$CODEX_CONFIG_DIR"
    echo "Created $CODEX_CONFIG_DIR"
fi

# Backup existing config if it exists
if [ -f "$CODEX_CONFIG" ]; then
    echo "Backing up existing Codex config..."
    cp "$CODEX_CONFIG" "$CODEX_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create symbolic link for Codex config
ln -sf "$DOTFILES_DIR/config/codex/config.toml" "$CODEX_CONFIG"
echo "Linked Codex config: $CODEX_CONFIG -> $DOTFILES_DIR/config/codex/config.toml"

# Create symbolic link for notification script
NOTIFY_SCRIPT="$CODEX_CONFIG_DIR/notify_macos.sh"
SOURCE_NOTIFY_SCRIPT="$DOTFILES_DIR/config/codex/notify_macos.sh"

# Backup existing notification script if it exists
if [ -f "$NOTIFY_SCRIPT" ]; then
    echo "Backing up existing notification script..."
    cp "$NOTIFY_SCRIPT" "$NOTIFY_SCRIPT.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create symbolic link for notification script
ln -sf "$SOURCE_NOTIFY_SCRIPT" "$NOTIFY_SCRIPT"
echo "Linked notification script: $NOTIFY_SCRIPT -> $SOURCE_NOTIFY_SCRIPT"

# Verify installation
if command -v codex &> /dev/null; then
    echo "✅ Codex installation and setup complete!"
    echo "📋 Usage: codex <<EOF"
    echo "         <your question or request>"
    echo "         EOF"
    echo "📝 Config file: $CODEX_CONFIG"
    echo "🔔 Notification script: $NOTIFY_SCRIPT"
else
    echo "❌ Installation may have failed. Please check the output above for errors."
    exit 1
fi
