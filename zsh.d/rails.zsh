export RAILS_3_SCRIPT="./script/rails"

function ss() {
	if [[ -f $RAILS_3_SCRIPT ]] ; then # We're using Rails 3
		./script/rails server $@
	else
		./script/server $@
	fi
}

function sg() {
	if [[ -f $RAILS_3_SCRIPT ]] ; then # We're using Rails 3
		./script/rails generate $@
	else
		./script/generate $@
	fi
}

function sc() {
	if [[ -f $RAILS_3_SCRIPT ]] ; then # We're using Rails 3
		./script/rails console $@
	else
		./script/console $@
	fi
}
