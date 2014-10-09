#!/usr/bin/env bash

# parse args 
for arg; do
	case $arg in
		--harmony)
		--vim)
		-*)
	esac
done

sudo apt-get update
sudo apt-get install -y git

curl --silent https://raw.githubusercontent.com/creationix/nvm/v0.17.0/install.sh | sh
. ~/.nvm/nvm.sh

node_version

if is_set $harmony; then
	node_version='0.11.14'
	# runs node with all harmony flags enabled
	printf "alias node='node --harmony'" >> ~/.bashrc
else
	node_version='0.10.32'
fi

nvm install "$node_version"
nvm alias default "$node_version"

# enables tab completion for nvm
printf '[[ -r "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion\n' >> ~/.bashrc
# enables tab completion for npm
printf '. <(npm completion)\n' >> ~/.bashrc

is_set() {
	[[ $1 = true ]]
}
