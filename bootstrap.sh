#!/usr/bin/env bash

main() {
	local harmony=false
	local vim=false

	# parse args 
	for arg; do
		case $arg in
			--harmony)
				harmony=true
				;;
			--vim)
				vim=true
				;;
			-*)
				printf "%s: invalid option -- '%s'\n" 'bootstrap.sh' "${arg*-}"
				;;	
			*)
				break
		esac
	done

	sudo apt-get update
	sudo apt-get install -y git

	setup_node "$harmony"
	[[ $vim == true ]] && setup_vim || return 0
}

setup_node() {
	local harmony=$1

	curl --silent https://raw.githubusercontent.com/creationix/nvm/v0.17.0/install.sh | sh
	. ~/.nvm/nvm.sh

	local node_version

	if [[ $harmony == true ]]; then
		node_version='0.11.14'
		# runs node with all harmony flags enabled by default
		printf "alias node='node --harmony'\n" >> ~/.bashrc
	else
		node_version='0.10.32'
	fi

	nvm install "$node_version"
	nvm alias default "$node_version"

	# enables tab completion for nvm
	printf '[[ -r "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion\n' >> ~/.bashrc
	# enables tab completion for npm
	printf '. <(npm completion)\n' >> ~/.bashrc
}

setup_vim() {
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	mv /vagrant/.vimrc ~/.vim
	# TODO install plugins
}

main "$@"
