#! /bin/zsh

alias gpatch='git diff master -p'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

alias touch_empty='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitkeep \;'

export PATH=/usr/local/git/bin:$PATH
export MANPATH=/usr/local/git/man:$MANPATH

# Alias 'git' to 'hub' wrapper, if hub is available
if hub &> /dev/null; then
    function git(){hub $@}
fi
