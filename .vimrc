set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
Plug 'croaker/mustang-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': 'sudo apt-get install -y build-essential cmake python-dev \| ./install.py' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
call plug#end()

let delimitMate_expand_cr=1

" hide YouCompleteMe's preview window
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

set background=dark
silent! colorscheme mustang

set laststatus=2
set number
set relativenumber

set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

set expandtab
set shiftwidth=2
set softtabstop=2
