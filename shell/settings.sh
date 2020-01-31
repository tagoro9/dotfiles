# Default editor
export EDITOR=vim

# Ant configuration
export ANT_OPTS='-Xms768m -Xmx1024m'

# Increase node memory by default
export NODE_OPTIONS='--max-old-space-size=2048'

# Color configuration
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# GO configuration
GOPATH=$HOME/go

# Path configuration
export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.jenv/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"

# Confiure jenv
eval "$(jenv init -)"
