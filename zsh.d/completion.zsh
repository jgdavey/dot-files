#! /bin/zsh

unsetopt flowcontrol

WORDCHARS=''

compinit

setopt always_to_end
setopt correct

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Shows files in color, same as LSCOLOR
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
