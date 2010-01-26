source "$HOME/.aliases"
source "$HOME/.exports"
source "$HOME/.zsh_git"
source "$HOME/.zsh_completion"
source "$HOME/.zsh_theme"

if [[ `uname -s` == 'Darwin' ]]; then
  source "$HOME/.zsh_osx"
fi

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
