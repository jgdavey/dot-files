unalias ss
unalias sg
unalias sc

export RAILS3SCRIPT="./script/rails"

function ss() {
	if [[ -f $RAILS3SCRIPT ]] ; then # We're using Rails 3
		./script/rails server $@
	else
		./script/server $@
	fi
}

function sg() {
	if [[ -f $RAILS3SCRIPT ]] ; then # We're using Rails 3
		./script/rails generate $@
	else
		./script/generate $@
	fi
}

function sc() {
	if [[ -f $RAILS3SCRIPT ]] ; then # We're using Rails 3
		./script/rails console $@
	else
		./script/console $@
	fi
}
