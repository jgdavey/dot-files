function sshkey --description 'copy ssh keys to clipboard'
	cat ~/.ssh/*.pub | pbcopy

end
