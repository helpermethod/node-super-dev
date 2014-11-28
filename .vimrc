set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'croaker/mustang-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

call vundle#end()
filetype plugin indent on

let delimitMate_expand_cr=1
let g:indentLine_color_term=244

syntax on
set background=dark
:silent! colorscheme mustang

set laststatus=2
set number

set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

set expandtab
set shiftwidth=2
set softtabstop=2

au FileType javascript call JavaScriptFold()
hi Folded ctermbg=244
