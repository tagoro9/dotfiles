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
