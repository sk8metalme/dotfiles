#!/bin/bash

# Bun installation script

echo "💪 Installing Bun..."

# Check if bun is already installed
if command -v bun &> /dev/null; then
    echo "👋 Bun is already installed."
    bun --version
    exit 0
fi

# Install Bun using the official installer
curl -fsSL https://bun.sh/install | bash

# Set PATH for immediate use in this script
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Check if installation was successful
if [ -f "$HOME/.bun/bin/bun" ]; then
    echo "🤛 Bun installation complete!"
    "$HOME/.bun/bin/bun" --version
    echo ""
    echo "⚠️  Note: Please restart your terminal or run 'source ~/.zshrc' to use bun command."
else
    echo "❌ Installation may have failed. Please check the output above for errors."
    exit 1
fi
