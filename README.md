# dotfiles

## Initial setup

```shell
mkdir -p ~/.local/share/chezmoi
git clone https://github.com/tagoro9/dotfiles ~/.local/share/chezmoi
cd ~/.local/share/chezmoi
./script/bootstrap
```

### fzf

When installing fzf with devbox, it will complain about its config file. We have to create it manually:

```shell
sudo tee "$DEVBOX_PACKAGES_DIR/share/fzf/fzf.zsh" > /dev/null <<EOF
# Setup fzf
# ---------
#if [[ ! "$PATH" == *${FZF_PATH}/bin* ]]; then
#  export PATH="$PATH:${FZF_PATH}/bin"
#fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_PATH}/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_PATH}/key-bindings.zsh"
EOF
sudo chmod 755 "$DEVBOX_PACKAGES_DIR/share/fzf/fzf.zsh"
```

## Overview

This repository uses [devbox](https://www.jetify.com/devbox) and [brew](https://brew.sh/) to manage applications. It tries to use devbox
as much as possible, but there are some applications that are not supported by devbox yet.

### Dev Workflow

The default terminal setup is a Claude-Code-first IDE built on zellij + helix + yazi + lazygit.

#### Layout

The default zellij layout (`tagoro9`) starts with:

- **Main terminal** (60%) — for Claude Code, shell commands
- **Sidebar** (40%) — yazi (file browser), lazygit, and a shell stacked vertically

Three swap layouts rearrange the tiled panes:

| Layout      | Description                             |
| ----------- | --------------------------------------- |
| **Default** | 65/35 vertical split                    |
| **Focus**   | Large pane (75%) + small terminal below |
| **Split**   | Equal 50/50 vertical split              |

#### Key Bindings

| Key               | Action                                       |
| ----------------- | -------------------------------------------- |
| `Alt [` / `Alt ]` | Cycle swap layouts (Default / Focus / Split) |
| `Alt y`           | Pane picker (jump to any pane by name)       |
| `Alt u`           | Jump back to previous pane                   |
| `Alt s`           | Star/unstar a pane for quick access          |
| `Ctrl w`          | Session mode                                 |

#### Project Launcher (`zp`)

Fuzzy-pick a project and open it in zellij:

```bash
zp
```

Scans `~/code`, `~/turo`, and `~/open-turo` for project directories. Inside zellij it opens a new tab; outside it starts a new session.

#### Typical Workflow

1. `zp` to open a project
2. Use the main pane for Claude Code
3. Use the side pane for helix, yazi, lazygit, or tests
4. `Alt [` / `Alt ]` to switch layouts as needed

#### Yazi

Yazi plugins are declared in `~/.config/yazi/package.toml` and installed with `ya pack -i` (run automatically by `./script/bootstrap`).

| Key       | Action                                                     |
| --------- | ---------------------------------------------------------- |
| `l`       | Enter directory (skips single-child) or open file in helix |
| `F`       | Smart filter (continuous, auto-enter)                      |
| `Ctrl-d`  | Diff selected with hovered file                            |
| `~`       | Chmod selected files                                       |
| `p`       | Paste into hovered dir or CWD                              |
| `T`       | Toggle preview pane                                        |
| `t` / `d` | Add / remove macOS tags                                    |
| `1-9`     | Start vim-style relative motion (e.g. `3j`, `5k`)          |

Preview enhancements (via piper):

- Markdown files rendered with glow
- Directories shown as eza tree
- CSV highlighted with bat
- Tarballs listed with tar
- Unknown binaries shown with hexyl

### Claude Plugins

The `claude/plugins` directory contains specialized [Claude Code](https://code.claude.com/) integrations. These plugins extend Claude's capabilities with custom agents, automation hooks, and developer tools.

- **[Code](./claude/plugins/code)**: Specialized coding agents and workflow definitions.
- **[DX](./claude/plugins/dx)**: Developer Experience utilities, including notifications and lifecycle hooks.

To install the plugins, run:

```
/plugin marketplace add tagoro9/dotfiles
/plugin install dx@tagoro9
/plugin install code@tagoro9
```

### Git signing key

To generate a git signing key, run:

```shell
# Generate a 4096-bit RSA key that doesn't expire
gpg --full-generate-key --expert

# Select these options:
# 4) RSA (sign only)
# 4) 4096 bits
# 0) key does not expire
# Then fill in your name and email
```

After generating the key, get your key ID with:

```shell
gpg --list-secret-keys --keyid-format=long
```

### Devbox mac apps

By default devbox installs mac apps in a specific folder, so they won't show up in launchpad and other places.

This directory will typically be `$DEVBOX_PACKAGES_DIR/Applications`

To make them appear in there, open the folder where they are installed
in finder, right click -> make alias -> copy to Applications.
