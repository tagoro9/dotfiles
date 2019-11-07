# Default editor
export EDITOR=vim

# Ant configuration
export ANT_OPTS='-Xms768m -Xmx1024m'

# Color configuration
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Path configuration
export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.jenv/bin:$PATH"

# Confiure jenv
eval "$(jenv init -)"
