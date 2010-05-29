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
%{$fg_bold[blue]%}%n%{$reset_color%}%{$fg[magenta]%}@%{$fg_bold[magenta]%}%m%{$reset_color%} %{$fg[cyan]%}%~ %{$fg_bold[green]%}$(__git_ps1)%{$fg[yellow]%}%# %{$reset_color%}'

RPROMPT='[%*]'

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

function pwd_title {
  print -Pn "\e]0;%n %~\a"
}

function cmd_title {
  print -Pn "\e]0;$1\a"
}


case "$TERM" in
  xterm*|rxvt*)
    preexec () {
      cmd_title # xterm
    }
    precmd () {
      pwd_title # xterm
    }
    ;;
  screen*)
    preexec () {
      local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
      echo -ne "\ek$CMD\e\\"
      cmd_title
    }
    precmd () {
      echo -ne "\ekzsh\e\\"
      pwd_title
    }
    ;;
esac
