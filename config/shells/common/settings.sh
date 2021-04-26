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

# GO configuration
export GOPATH=$HOME/go

# Path configuration
export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/bin:$HOME/.jenv/bin:/usr/local/go/bin:$GOPATH/bin:$HOME/flutter/bin:$PATH"

# Confiure jenv
eval "$(jenv init -)"

# Configure pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
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
