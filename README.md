# Dotfiles

My dotfiles.

## Installation

1. Clone this repository.
1. Run `./script/setup`.
1. If `brew` is not installed, it will be installed and then the program will exit (the brew installation will ask you to execute some cmds to add brew to 
the path). After that, execute the script again and everything will be configured.
1. Install and configure [meslo-nerd-font-patched-for-powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) font.

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

## neovim

When opening vim the first time, there will be a couple of errors. Execute `:PaqInstall` and then `:Reload` to have everything configured.
