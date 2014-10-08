#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git

curl --silent https://raw.githubusercontent.com/creationix/nvm/v0.17.0/install.sh | sh
. ~/.nvm/nvm.sh
nvm install 0.11.14
nvm alias default 0.11.14
# enables tab completion for nvm
printf '[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion\n' >> ~/.bashrc
# enables tab completion for npm
printf '. <(npm completion)\n' >> ~/.bashrc
printf "alias node='node --harmony'" >> ~/.bashrc
