#! /bin/zsh

## Key Bindings
bindkey -e # Use emacs keybindings

# edit command in EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '\ee' edit-command-line

# Make delete work in Terminal
stty erase ^H
bindkey "^[[3~" delete-char

bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey -s '\e.' "..\n"
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
# bindkey ' ' magic-space # also do history expansion on space
