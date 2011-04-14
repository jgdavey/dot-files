system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

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

# Auto-completions
complete -C ~/.bash.d/rake-completion.rb -o default rake

# changing directory to code project
function c { cd ~/code/$1; }
complete -C ~/.bash.d/project_completion.rb -o default c
