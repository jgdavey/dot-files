system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

source ~/.exports
source ~/.gitrc
source ~/.aliases
source ~/.save-directory

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.terminal
fi

function prompt
{
local GREEN="\[\033[1;32m\]"
local RED="\[\033[0;31m\]"
local YELLOW="\[\033[1;33m\]"
local BOLDBLUE="\[\033[1;34m\]"
local CYAN="\[\033[0;36m\]"
local MAGENTA="\[\033[1;35m\]"
local GRAY="\[\033[0;37m\]"
local BLUE="\[\033[0;34m\]"
local DEFAULT="\[\033[0;38m\]"
export PS1="\n${BOLDBLUE}\u ${CYAN}\w ${GREEN}\$(__git_ps1 '(%s) ')${YELLOW}$ ${DEFAULT}"
}
prompt

# readline settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

shopt -s histappend
# shopt -s checkwinsize
# shopt -s globstar

# Auto-completions
complete -C ~/.rake-completion.rb -o default rake


# changing directory to code project
function s { cd ~/Sites/$1; }
complete -C ~/.project_completion.rb -o default s

if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Automatically add SSH identity for forwarding
ssh-add &> /dev/null
