# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that is currently in its initial state. The repository contains minimal content and is ready for dotfiles configuration to be added.

## Current Structure

- **README.md**: Basic repository description in English and Japanese
- **No dotfiles present yet**: This is a fresh repository awaiting configuration files

## Development Workflow

Since this is a dotfiles repository without build tools or package managers, development consists of:

1. **Adding configuration files**: Place dotfiles (like `.zshrc`, `.vimrc`, `.gitconfig`) in the repository
2. **Creating installation scripts**: Consider adding `install.sh` or similar for automated setup
3. **Symbolic link management**: Implement linking from repository to home directory
4. **Version control**: Use git to track changes to configuration files

## Common Dotfiles Patterns

When adding dotfiles, consider these typical configurations:
- Shell: `.zshrc`, `.bashrc`, `.profile`
- Git: `.gitconfig`, `.gitignore_global`
- Editors: `.vimrc`, `.config/nvim/`
- SSH: `.ssh/config`
- Development tools: language-specific configs in `.config/`

## Installation Strategy

For a dotfiles repository, consider implementing:
- Backup existing configs before linking
- Selective installation (allow choosing which configs to install)
- OS-specific configurations
- Dependency checking before installation