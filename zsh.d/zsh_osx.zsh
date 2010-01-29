#! /bin/zsh

if [[ `uname -s` == 'Darwin' ]]; then
  export EDITOR='mate -w'
  export VISUAL=$EDITOR
  export GEM_OPEN_EDITOR='mate'

  function manpdf() { man -t $@ | open -f -a Preview; }
  alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"'
  alias hidefile='/usr/bin/SetFile -a "V"'
  alias showfile='/usr/bin/SetFile -a "v"'


function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}
fi