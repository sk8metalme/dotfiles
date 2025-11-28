#!/bin/bash

# Claude Code npm installation script

echo "Installing Claude Code via npm..."

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install Node.js and npm first."
    exit 1
fi

# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Check if installation was successful
if command -v claude &> /dev/null; then
    echo "Claude Code installation complete!"
    echo "You can now use 'claude' command from anywhere."
else
    echo "Installation may have failed. Please check the output above for errors."
    exit 1
fi

# safe-chain https://github.com/AikidoSec/safe-chain
echo "Installing safe-chain via npm..."
npm install -g @aikidosec/safe-chain
