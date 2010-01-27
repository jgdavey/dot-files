#! /bin/zsh

export ZSH="$HOME/.zsh.d"

# Add function path
fpath=($ZSH/func $fpath)


## Load some aliases, exports from BASH
source "$HOME/.exports"
source "$HOME/.aliases"

# Load all .zsh files under ~/.zsh.d/
for config_file ($ZSH/*.zsh) source $config_file

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
