# Path to oh-my-zsh and zplug installations.
export ZSH=~/.oh-my-zsh
export ZPLUG_HOME=~/.zplug/

# Load zplug
source $ZSH/oh-my-zsh.sh
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Load theme
zplug 'dracula/zsh', as:theme

# Plugins
zplug mafredri/zsh-async, from:github
zplug plugins/aws, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/fzf, from:oh-my-zsh
zplug unixorn/fzf-zsh-plugin, from:github
zplug Aloxaf/fzf-tab, from:github
zplug plugins/git, from:oh-my-zsh
zplug plugins/node, from:oh-my-zsh
zplug plugins/npm, from:oh-my-zsh
zplug plugins/nvm, from:oh-my-zsh
zplug plugins/macos, from:oh-my-zsh
zplug plugins/vi-mode, from:oh-my-zsh
zplug plugins/terraform, from:oh-my-zsh
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-history-substring-search
zplug zsh-users/zsh-syntax-highlighting

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install missing plugins? [y/N]:"
   if read -q; then
      echo; zplug install
   fi
fi

# Then, source plugins and add commands to $PATH
zplug load

