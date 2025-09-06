#!/bin/bash

# Claude Code settings installation script

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
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

# Create symbolic link for main settings
ln -sf "$DOTFILES_DIR/config/claude/settings.json" "$CLAUDE_SETTINGS"
echo "Linked Claude settings: $CLAUDE_SETTINGS -> $DOTFILES_DIR/config/claude/settings.json"

# Create symbolic links for additional Claude configuration
echo "Setting up additional Claude configuration..."

# Create agents directory
if [ ! -d "$CLAUDE_CONFIG_DIR/agents" ]; then
    mkdir -p "$CLAUDE_CONFIG_DIR/agents"
fi

# Create commands directory
if [ ! -d "$CLAUDE_CONFIG_DIR/commands" ]; then
    mkdir -p "$CLAUDE_CONFIG_DIR/commands"
fi

# Link agents
if [ -d "$DOTFILES_DIR/config/claude/agents" ]; then
    echo "Linking agents from $DOTFILES_DIR/config/claude/agents"
    for agent in "$DOTFILES_DIR/config/claude/agents"/*; do
        if [ -f "$agent" ]; then
            agent_name=$(basename "$agent")
            ln -sf "$agent" "$CLAUDE_CONFIG_DIR/agents/$agent_name"
            echo "Linked agent: $agent_name"
        fi
    done
else
    echo "No agents directory found at $DOTFILES_DIR/config/claude/agents"
fi

# Link commands
if [ -d "$DOTFILES_DIR/config/claude/commands" ]; then
    echo "Linking commands from $DOTFILES_DIR/config/claude/commands"
    for command in "$DOTFILES_DIR/config/claude/commands"/*; do
        if [ -f "$command" ]; then
            command_name=$(basename "$command")
            ln -sf "$command" "$CLAUDE_CONFIG_DIR/commands/$command_name"
            echo "Linked command: $command_name"
        fi
    done
else
    echo "No commands directory found at $DOTFILES_DIR/config/claude/commands"
fi

echo "Claude Code settings installation complete!"
