source "$HOME/.aliases"
source "$HOME/.exports"
source "$HOME/.zsh_git"
source "$HOME/.zsh_completion"
source "$HOME/.zsh_theme"


# Work computer overrides
if [[ $HOME == "/Users/josh" ]]; then
	export GEMDIR="$HOME/.gem/ruby/1.8"
fi

# changing directory to code project
function s { cd ~/Sites/$1; }

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
