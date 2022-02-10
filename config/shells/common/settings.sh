# Default editor
if type nvim > /dev/null 2>&1;
then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

# Ant configuration
export ANT_OPTS='-Xms768m -Xmx1024m'

# Increase node memory by default
export NODE_OPTIONS='--max-old-space-size=3096'

# Color configuration
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Path configuration
# Load homebrew environment
# I want my tools to have precedence over homebrew bins
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/bin:$HOME/flutter/bin:$PYENV_ROOT/bin:$PATH"

# GO configuration
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"

# Configure pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Configure FZF

# Do not use full screen mode
export FZF_DEFAULT_OPTS='--height 50% --reverse'
# Use ripgrep instead of grep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Configure AWS
export AWS_REGION=us-east-1

# Configure PGP TTY
export GPG_TTY=$(tty)

PROFILE_DIR="${HOME}/.tagoro9/profile"

# if the directory PROFILE_DIR exists, source of the files in it
# this allows to load into the shell files that can't be part of git
if [ -d "$PROFILE_DIR" ]; then
    # for all files in $TURO_PROFILE_DIR source the contents
    for file in "$PROFILE_DIR"/*; do
        source "$file"
    done
fi

