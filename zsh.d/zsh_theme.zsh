#! /bin/zsh
# ls colors
autoload colors; colors;

# Apply theming defaults
PS1="%n@%m %~ %# "
PROMPT=$PS1

# Setup the prompt with pretty colors
setopt prompt_subst

PROMPT='
%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg[cyan]%}%~ %{$fg[yellow]%}%# %{$reset_color%}'

RPROMPT='[%*]'
