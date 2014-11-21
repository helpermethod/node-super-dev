set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'croaker/mustang-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
filetype plugin indent on

let g:NERDTreeDirArrows=0

syntax on
set background=dark
:silent! colorscheme mustang

set laststatus=2
set number

set incsearch
set hlsearch
set ignorecase
nnoremap <CR> :nohhlsearch<CR><CR>

set expandtab
set shiftwidth=2
set softtabstop=2
