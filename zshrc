#! /bin/zsh

customzsh='/usr/local/Cellar/zsh/4.3.10/bin/zsh'
if [[ -f "$customzsh" ]] && [ "$SHELL" != "$customzsh" ]; then
  export SHELL=$customzsh
  exec $customzsh
fi

export ZSH="$HOME/.zsh.d"

# Add function path
fpath=($ZSH/func $fpath)
autoload -U $ZSH/func/*(:t)

## Load some aliases, exports from BASH
source "$HOME/.exports"
source "$HOME/.aliases"

# Load all .zsh files under ~/.zsh.d/
for config_file ($ZSH/*.zsh) source $config_file

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
