#! /bin/zsh

alias gs='git status'
alias gst='git status'
alias gl='git log -p'
alias ga='git add .'
alias gpull='git pull --rebase'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gco='git checkout'

alias gpatch='git diff master -p'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

alias touch_empty='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitkeep \;'

export PATH=/usr/local/git/bin:$PATH
export MANPATH=/usr/local/git/man:$MANPATH

# get the name of the branch we are on
function git_prompt_info() {
    __git_ps1
}


# Alias 'git' to 'hub' wrapper, if hub is available
if hub &> /dev/null; then
    function git(){hub $@}
fi
