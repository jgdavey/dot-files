system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

source ~/.exports
source ~/.bash.d/git.sh
source ~/.aliases

export PS1="\n${COLOR_LIGHT_BLUE}\u ${COLOR_CYAN}\w ${COLOR_YELLOW}$ ${COLOR_NC}"

# readline settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

shopt -s histappend
# shopt -s checkwinsize
# shopt -s globstar

# Auto-completions
complete -C ~/.bash.d/rake-completion.rb -o default rake
