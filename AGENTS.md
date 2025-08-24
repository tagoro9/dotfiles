# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository that uses [chezmoi](https://www.chezmoi.io/) to manage configuration files across systems. The repository manages development environments using [devbox](https://www.jetify.com/devbox) for CLI tools and [Homebrew](https://brew.sh/) for macOS applications.

## Setup and Installation

### Initial Setup

```bash
mkdir -p ~/.local/share/chezmoi
git clone https://github.com/tagoro9/dotfiles ~/.local/share/chezmoi
cd ~/.local/share/chezmoi
./script/bootstrap
```

### Development Environment

The repository uses devbox for managing development tools and dependencies:

- All CLI tools and language servers are defined in `config/private_dot_local/share/devbox/global/default/devbox.json`
- macOS applications are managed via Homebrew in the `Brewfile`
- Initial setup installs devbox, Homebrew (on macOS), and runs `devbox global install`

## Common Commands

### Package Management

```bash
# Install new devbox package
devbox global add <package>@<version>
./script/import-devbox-changes  # Import changes back to chezmoi

# Update Homebrew packages
brew bundle  # Install from Brewfile
```

### Configuration Management

```bash
# Apply configuration changes
chezmoi apply

# Add new files to management
chezmoi add <file>

# View what would change
chezmoi diff
```

### Validation and Linting

```bash
# Run all pre-commit hooks
pre-commit run -a

# Check formatting and linting
pre-commit run prettier --all-files

# Test specific hook
pre-commit run commitlint --all-files
```

## Architecture and Structure

### Core Components

- **chezmoi templates**: Configuration files with `.tmpl` extension that support templating
- **dotfiles**: Shell configuration (zsh, bash), editor configs (vim, helix, cursor), and terminal setup (ghostty, zellij)
- **Development tools**: Complete development environment with version managers (mise), build tools, and language servers

### Key Directories

- `config/`: Contains all dotfiles and configuration templates
- `config/private_dot_*`: Files that will be placed in user's home directory with dot prefix
- `config/dot_*`: Public dotfiles (shell configs, etc.)
- `script/`: Utility scripts for setup and maintenance

### Shell Environment

The shell configuration is modular:

- `config/private_dot_config/shell/common.sh`: Sources all shell modules
- `config/private_dot_config/shell/settings.sh`: Environment variables and settings
- `config/private_dot_config/shell/functions.sh`: Custom shell functions
- `config/private_dot_config/shell/aliases.sh`: Command aliases

### Pre-commit Configuration

The repository enforces code quality with pre-commit hooks:

- JSON/YAML validation
- Prettier formatting
- Conventional commit messages via commitlint
- Trailing whitespace and EOF fixes

## Important Notes

### Dependency Management

- All devbox packages are pinned to specific versions
- Use `./script/import-devbox-changes` after adding new packages to sync with chezmoi
- Script sorts packages alphabetically and formats JSON with prettier
- Cursor extensions are managed in `config/cursor-extensions.txt` and can be installed with `cat config/cursor-extensions.txt | xargs -n 1 code --install-extension`

### Git Workflow

- Uses conventional commits (enforced by commitlint)
- Pre-commit hooks validate formatting and structure
- GPG signing is configured via templates in git config

### macOS Specific

- Homebrew installs applications to standard locations
- Devbox applications install to `$DEVBOX_PACKAGES_DIR/Applications` and need manual aliases for Launchpad visibility
