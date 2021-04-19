# Dotfiles

My dotfiles.

## Installation

1. Clone this repository.
2. Run `./script/setup`.
3. Install and configure [meslo-nerd-font-patched-for-powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) font.

## Folder structure

All the configuration is inside the `config` folder:

```
config
├── bin # Any executable. Everything here makes it to the user path
├── git
├── gpg
├── shells
│   ├── bash
│   ├── common
│   └── zsh
└── terminals
```

## Local overrides

Create the following local files to extend the default configuration:

- `~/.local_shell_aliases` to add shell aliases that should not be in VCS
