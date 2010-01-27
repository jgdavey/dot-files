#! /bin/zsh

## Command history configuration
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=$HISTSIZE

setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
