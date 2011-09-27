#! /bin/zsh

alias gpatch='git diff master -p'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

alias touch_empty='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitkeep \;'
