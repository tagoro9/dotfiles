# Default editor
if type nvim > /dev/null 2>&1;
then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

# Increase node memory by default
export NODE_OPTIONS='--max-old-space-size=3096'

# Path configuration
# Load homebrew environment
# I want my tools to have precedence over homebrew bins
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/bin:$HOME/flutter/bin:$PYENV_ROOT/bin:$PATH"

# Configure AWS
#export AWS_REGION=us-east-1

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

# Dracula theme for exa
# https://draculatheme.com/exa
export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

