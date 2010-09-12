#! /bin/zsh

if [[ `uname -s` == 'Darwin' ]]; then
  function manpdf() { man -t $@ | open -f -a Preview; }
  alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"'
  alias hidefile='/usr/bin/SetFile -a "V"'
  alias showfile='/usr/bin/SetFile -a "v"'

  export EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"'
  export VISUAL=$EDITOR

  alias gvim='mvim'

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
