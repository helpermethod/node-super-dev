set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'croaker/mustang-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
:silent! colorscheme mustang

let g:NERDTreeDirArrows=0

set laststatus=2
set number
