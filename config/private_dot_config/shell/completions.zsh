#!/usr/bin/env zsh

fpath+="$HOME/.config/shell/completions"

# For some reason \n don't work well for this variable inside zellij
# Tiny update to https://github.com/unixorn/fzf-zsh-plugin/blob/909f0b8879481eab93741fa284a7d1d13cf6f79e/fzf-zsh-plugin.plugin.zsh#L149C1-L149C68
export FZF_DEFAULT_OPTS=$(printf '%s  ' "${FZF_DEFAULT_OPTS[@]//$'\n'/ }")
