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
PROMPT=$PS1

# Setup the prompt with pretty colors
setopt prompt_subst

PROMPT='
%{$fg_bold[blue]%}%n %{$fg[cyan]%}%~ %{$fg_bold[green]%}$(__git_ps1)%{$fg[yellow]%}%# %{$reset_color%}'


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
