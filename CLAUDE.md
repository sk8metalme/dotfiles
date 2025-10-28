# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages macOS development environment configurations including shell, editor, and text expansion tools.

## Current Structure

- **config/**: Configuration files organized by application
  - **espanso/**: Text expansion tool configurations
    - `config/default.yml`: Main Espanso settings
    - `match/*.yml`: Snippet definitions (AI tools, programming languages, frameworks, etc.)
  - **vscode/**: Visual Studio Code settings and extensions list
  - **zsh/**: Zsh shell configuration split into modular files
- **setup-scripts/**: Automated setup scripts for each tool
  - `setup-espanso.sh`: Creates symlinks for Espanso configurations
  - `setup-vscode.sh`: Sets up VSCode settings
  - `setup-zsh.sh`: Sets up Zsh configurations
  - And other installation/setup scripts
- **README.md**: Comprehensive setup guide in Japanese
- **.zshrc, .zshenv**: Zsh initialization files (root level)

## Development Workflow

This dotfiles repository uses symlinks to manage configurations:

1. **Configuration files** are stored in the repository (`config/`)
2. **Setup scripts** create symlinks from repository to system locations
3. **Changes** made in repository automatically reflect in the applications
4. **Version control** tracks all configuration changes via Git

### Working with Espanso

- Edit snippet files in `config/espanso/match/*.yml`
- Changes are immediately available (symlinked to `~/.config/espanso/`)
- Run `espanso restart` after major configuration changes
- All snippets are version controlled and portable

### Setup Process

Each tool has its own setup script in `setup-scripts/`:
- Backs up existing configurations
- Creates necessary directories
- Establishes symlinks to repository files
- Performs tool-specific initialization

## Common Dotfiles Patterns

Managed configurations in this repository:
- **Shell**: `.zshrc`, `.zshenv`, `config/zsh/*.zsh`
- **Git**: `.gitconfig` (with personal/work separation)
- **Editors**: VSCode settings in `config/vscode/`
- **Text Expansion**: Espanso configurations in `config/espanso/`
- **Development tools**: Tool-specific configs stored in `config/`

## Installation Strategy

This repository implements:
- ✅ **Backup existing configs** before linking (timestamped backups)
- ✅ **Selective installation** via individual setup scripts
- ✅ **OS-specific configurations** (macOS focused)
- ✅ **Dependency checking** within setup scripts (e.g., checking if espanso is installed)
- ✅ **Modular structure** for easy maintenance and extension