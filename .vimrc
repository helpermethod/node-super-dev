set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
:silent! colorscheme seoul256
