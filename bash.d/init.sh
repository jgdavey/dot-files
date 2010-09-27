system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

alias sprof='source ~/.bash_profile'

source ~/.exports
source ~/.bash.d/git.sh
source ~/.aliases

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.bash.d/terminal.sh
fi

export COLOR_NC="\[\033[0;38m\]" # No Color
export COLOR_WHITE="\[\033[1;37m\]"
export COLOR_BLACK="\[\033[0;30m\]"
export COLOR_BLUE="\[\033[0;34m\]"
export COLOR_LIGHT_BLUE="\[\033[1;34m\]"
export COLOR_GREEN="\[\033[0;32m\]"
export COLOR_LIGHT_GREEN="\[\033[1;32m\]"
export COLOR_CYAN="\[\033[0;36m\]"
export COLOR_LIGHT_CYAN="\[\033[1;36m\]"
export COLOR_RED="\[\033[0;31m\]"
export COLOR_LIGHT_RED="\[\033[1;31m\]"
export COLOR_PURPLE="\[\033[0;35m\]"
export COLOR_LIGHT_PURPLE="\[\033[1;35m\]"
export COLOR_BROWN="\[\033[0;33m\]"
export COLOR_YELLOW="\[\033[1;33m\]"
export COLOR_GRAY="\[\033[0;30m\]"
export COLOR_LIGHT_GRAY="\[\033[0;37m\]"
export PS1="\n${COLOR_LIGHT_BLUE}\u ${COLOR_CYAN}\w ${COLOR_LIGHT_GREEN}\$(__git_ps1 '(%s) ')${COLOR_YELLOW}$ ${COLOR_NC}"

# readline settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

shopt -s histappend
# shopt -s checkwinsize
# shopt -s globstar

# Auto-completions
complete -C ~/.bash.d/rake-completion.rb -o default rake

# Work computer overrides
if [[ $HOME == "/Users/josh" ]]; then
	export GEMDIR="$HOME/.gem/ruby/1.8"
fi

# changing directory to code project
function s { cd ~/Sites/$1; }
complete -C ~/.bash.d/project_completion.rb -o default s


# Automatically add SSH identity for forwarding
ssh-add &> /dev/null
