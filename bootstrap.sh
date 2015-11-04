#!/usr/bin/env bash

readonly nvm_version=v0.29.0

main() {
  local vim=false

  for arg; do
    case $arg in
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

  __setup_node
  [[ $vim == true ]] && __setup_vim || true
}

__setup_node() {
  curl --silent https://raw.githubusercontent.com/creationix/nvm/"$nvm_version"/install.sh | sh
  . ~/.nvm/nvm.sh

  nvm install stable

  # enable tab completion for nvm
  printf '[[ -r "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion\n' >> ~/.bashrc

  nvm alias default stable

  # enable tab completion for npm
  npm completion >> ~/.bashrc
}

__setup_vim() {
  cp /vagrant/{.vimrc,.tmux.conf} ~

  npm install -g eslint
}

main "$@"
