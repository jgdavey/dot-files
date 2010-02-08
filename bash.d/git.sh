source ~/.bash.d/_git-completion

alias git='hub'
alias gs='git status'
alias gl='git log -p'
alias ga='git add .'
alias gpull='git pull --rebase'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gco='git checkout'
alias gdc='git-svn dcommit'
alias gk='gitk --all &'

alias gpatch='git diff master -p'
alias gitrm="git stat | grep deleted | awk '{print \$3}' | xargs git rm"

alias touch_empty='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;'

export PATH=/usr/local/git/bin:$PATH
export MANPATH=/usr/local/git/man:$MANPATH