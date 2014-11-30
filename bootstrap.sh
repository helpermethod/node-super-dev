#!/usr/bin/env bash

main() {
	local harmony=false
	local vim=false

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

	__setup_node "$harmony"
	[[ $vim == true ]] && __setup_vim || true
}

__setup_node() {
	local harmony=$1

	curl --silent https://raw.githubusercontent.com/creationix/nvm/v0.17.0/install.sh | sh
	. ~/.nvm/nvm.sh

	local node_version

	if [[ $harmony == true ]]; then
		node_version='0.11.14'
		# runs node with all harmony flags enabled by default
		printf "alias node='node --harmony'\n" >> ~/.bashrc
	else
		node_version='0.10.33'
	fi

	nvm install "$node_version"

	# enables tab completion for nvm
	printf '[[ -r "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion\n' >> ~/.bashrc

	__setup_global_node
	nvm use system

	# enables tab completion for npm
	printf '. <(npm completion)\n' >> ~/.bashrc
}

__setup_global_node() {
	local node_path=$(which node)
	node_path=${node_path%/bin/node}
	chmod -R 755 "$node_path"/bin/* 
	sudo cp -r "$node_path"/{bin,lib,share} /usr/local
}

__setup_vim() {
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp /vagrant/.vimrc ~
	vim +PluginInstall +qall

	npm install -g jshint
	__setup_you_complete_me
	(cd ~/.vim/bundle/tern_for_vim && npm install)
}

__setup_you_complete_me() {
	sudo apt-get install -y build-essential cmake python-dev
	# prevents running out of memory when compiling YouCompleteMe
	__create_swap
	(cd ~/.vim/bundle/YouCompleteMe && ./install.sh)
	__delete_swap
}

__create_swap() {
	sudo fallocate -l 1G /swap
	sudo mkswap /swap
	sudo swapon /swap
}

__delete_swap() {
	sudo swapoff -a
	sudo rm -f /swap
}

main "$@"
