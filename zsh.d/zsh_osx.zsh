#! /bin/zsh

if [[ `uname -s` == 'Darwin' ]]; then
  # changing directory to code project
  function s { cd ~/Sites/$1; }

  export EDITOR='mate -w'
  export VISUAL=$EDITOR
  export GEM_OPEN_EDITOR='mate'

  function manpdf() { man -t $@ | open -f -a Preview; }
  alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"'
  alias hidefile='/usr/bin/SetFile -a "V"'
  alias showfile='/usr/bin/SetFile -a "v"'
fi