system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

alias sprof='source ~/.bash_profile'

source ~/.exports
source ~/.aliases

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.bash.d/terminal.sh
fi

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
function c { cd ~/current/$1; }
complete -C ~/.bash.d/project_completion.rb -o default c
