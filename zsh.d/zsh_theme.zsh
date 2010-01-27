#! /bin/zsh
# ls colors
autoload colors; colors;

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n %~ %# "
PROMPT="%n %~ %# "

# Setup the prompt with pretty colors
setopt prompt_subst

PROMPT='
%{$fg_bold[blue]%}%n %{$fg[cyan]%}%~ %{$fg_bold[green]%}$(__git_ps1)%{$fg[yellow]%}%# %{$reset_color%}'



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

function title {
  if [[ $TERM == "screen" ]]; then
    # Use these two for GNU Screen:
    print -nR $'\033k'$1$'\033'\\\

    print -nR $'\033]0;'$2$'\a'
  elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
  fi
}

# function precmd {
#   title zsh "$PWD"
# }
#
# function preexec {
#   emulate -L zsh
#   local -a cmd; cmd=(${(z)1})
#   title $cmd[1]:t "$cmd[2,-1]"
# }

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}

function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

case "$TERM" in
  xterm*|rxvt*)
    preexec () {
      print -Pn "\e]0;%n@%m: $1\a" # xterm
    }
    precmd () {
      print -Pn "\e]0;%n@%m: %~\a" # xterm
    }
    ;;
  screen*)
    preexec () {
      local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
      echo -ne "\ek$CMD\e\\"
      print -Pn "\e]0;%n@%m: $1\a" # xterm
    }
    precmd () {
      echo -ne "\ekzsh\e\\"
      print -Pn "\e]0;%n@%m: %~\a" # xterm
    }
    ;;
esac
