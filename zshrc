# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZPLUG_HOME=~/.zplug/
# Load zplug
source $ZPLUG_HOME/init.zsh
source $ZSH/oh-my-zsh.sh

# Load theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Plugins
zplug mafredri/zsh-async, from:github
zplug plugins/aws, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/fzf, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/git-extras, from:oh-my-zsh
zplug plugins/node, from:oh-my-zsh
zplug plugins/npm, from:oh-my-zsh
zplug plugins/osx, from:oh-my-zsh
zplug plugins/z, from:oh-my-zsh
zplug plugins/gem, from:oh-my-zsh
zplug plugins/vi-mode, from:oh-my-zsh
zplug plugins/terraform, from:oh-my-zsh
zplug lukechilds/zsh-nvm
zplug zpm-zsh/title

zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-history-substring-search
zplug Aloxaf/fzf-tab, from:github

# Fix slowness of pastes with zsh-syntax-highlighting.zsh
# See https://gist.github.com/magicdude4eva/2d4748f8ef3e6bf7b1591964c201c1ab
# See https://github.com/vercel/hyper/issues/1276
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install missing plugins? [y/N]:"
   if read -q; then
      echo; zplug install
   fi
fi

PROMPT_TITLE='$PWD'

 # Then, source plugins and add commands to $PATH
 zplug load

# Update fpath to include custom completions
fpath=( ~/.completions "${fpath[@]}" )

# Bind back fzf keys as they get overriden by the vi mode
bindkey '^I' fzf-tab-complete

source ~/.bashrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
