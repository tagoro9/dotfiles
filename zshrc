# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZPLUG_HOME=~/.zplug/
# Load zplug
source $ZPLUG_HOME/init.zsh
source $ZSH/oh-my-zsh.sh

# Load theme
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Plugins
zplug mafredri/zsh-async, from:github
zplug plugins/compleat, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/git-extras, from:oh-my-zsh
zplug plugins/node, from:oh-my-zsh
zplug plugins/npm, from:oh-my-zsh
zplug plugins/osx, from:oh-my-zsh
zplug plugins/z, from:oh-my-zsh
zplug plugins/gem, from:oh-my-zsh
zplug plugins/vi-mode, from:oh-my-zsh

zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-history-substring-search


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install missing plugins? [y/N]:"
   if read -q; then
      echo; zplug install
   fi
fi

 # Then, source plugins and add commands to $PATH
 zplug load

source ~/.bashrc
