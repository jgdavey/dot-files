system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

source ~/.exports
source ~/.gitrc
source ~/.aliases
#source ~/.save-directory

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.terminal
fi

export PS1="\n$COLOR_LIGHT_BLUE\u $COLOR_CYAN\w $COLOR_LIGHT_GREEN\$(__git_ps1 '(%s) ')${COLOR_YELLOW}$ $COLOR_NC"

# readline settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

shopt -s histappend
# shopt -s checkwinsize
# shopt -s globstar

# Auto-completions
complete -C ~/.rake-completion.rb -o default rake

# Work computer overrides
if [[ $HOME == "/Users/josh" ]]; then
	export GEMDIR="$HOME/.gem/ruby/1.8"
fi

# changing directory to code project
function s { cd ~/Sites/$1; }
complete -C ~/.project_completion.rb -o default s

if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi


# Automatically add SSH identity for forwarding
ssh-add &> /dev/null
