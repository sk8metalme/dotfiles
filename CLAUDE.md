# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages macOS development environment configurations including shell, editor, window management, and productivity tools.

## Current Structure

- **config/**: Configuration files organized by application
  - **hammerspoon/**: Window management and automation tool configurations
    - `init.lua`: Main Hammerspoon configuration
  - **raycast/**: Productivity launcher and tool configurations
    - `settings.rayconfig`: Raycast settings export file
  - **vscode/**: Visual Studio Code settings and extensions list
  - **zsh/**: Zsh shell configuration split into modular files
- **setup-scripts/**: Automated setup scripts for each tool
  - `install-apps.sh`: Install macOS applications
  - `install-brew-package.sh`: Install Homebrew packages
  - `install-bun.sh`: Install Bun JavaScript runtime
  - `install-oh-my-zsh.sh`: Install Oh My Zsh
  - `setup-hammerspoon.sh`: Configure Hammerspoon symlinks
  - `setup-MacOS.sh`: Configure macOS system preferences
  - `setup-raycast.sh`: Guide Raycast configuration import
  - `setup-vscode.sh`: Configure VSCode symlinks
  - `setup-zsh.sh`: Configure Zsh symlinks
- **README.md**: Comprehensive setup guide in Japanese
- **.zshrc, .zshenv, .gitconfig**: Configuration files at root level

## Development Workflow

This dotfiles repository uses symlinks to manage configurations:

1. **Configuration files** are stored in the repository (`config/`)
2. **Setup scripts** create symlinks from repository to system locations
3. **Changes** made in repository automatically reflect in the applications
4. **Version control** tracks all configuration changes via Git

### Setup Process

Each tool has its own setup script in `setup-scripts/`:
- Backs up existing configurations
- Creates necessary directories
- Establishes symlinks to repository files
- Performs tool-specific initialization

### Working with Hammerspoon

- Edit configuration in `config/hammerspoon/init.lua`
- Changes are immediately available (symlinked to `~/.hammerspoon/`)
- Reload Hammerspoon configuration after changes
- All configurations are version controlled and portable

## Common Dotfiles Patterns

Managed configurations in this repository:
- **Shell**: `.zshrc`, `.zshenv`, `config/zsh/*.zsh`
- **Git**: `.gitconfig`
- **Editors**: VSCode settings in `config/vscode/`
- **Window Management**: Hammerspoon automation in `config/hammerspoon/`
- **Productivity Tools**: Raycast settings in `config/raycast/`

## Installation Strategy

This repository implements:
- ✅ **Backup existing configs** before linking (timestamped backups)
- ✅ **Selective installation** via individual setup scripts
- ✅ **OS-specific configurations** (macOS focused)
- ✅ **Dependency checking** within setup scripts
- ✅ **Modular structure** for easy maintenance and extension