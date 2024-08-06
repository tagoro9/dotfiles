# Dotfiles

My dotfiles.

## Installation

1. Clone this repository.
1. Run `./script/setup`.
1. If `brew` is not installed, it will be installed and then the program will exit (the brew installation will ask you to execute some cmds to add brew to
the path). After that, execute the script again and everything will be configured.
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
