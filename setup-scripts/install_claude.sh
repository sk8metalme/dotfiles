#!/bin/bash

# Claude Code settings installation script

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_CONFIG_DIR="$HOME/.claude"
CLAUDE_SETTINGS="$CLAUDE_CONFIG_DIR/settings.json"

echo "Installing Claude Code settings..."

# Create .claude directory if it doesn't exist
if [ ! -d "$CLAUDE_CONFIG_DIR" ]; then
    mkdir -p "$CLAUDE_CONFIG_DIR"
    echo "Created $CLAUDE_CONFIG_DIR"
fi

# Backup existing settings if they exist
if [ -f "$CLAUDE_SETTINGS" ]; then
    echo "Backing up existing Claude settings..."
    cp "$CLAUDE_SETTINGS" "$CLAUDE_SETTINGS.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create symbolic link
ln -sf "$DOTFILES_DIR/config/claude/settings.json" "$CLAUDE_SETTINGS"
echo "Linked Claude settings: $CLAUDE_SETTINGS -> $DOTFILES_DIR/config/claude/settings.json"

echo "Claude Code settings installation complete!"