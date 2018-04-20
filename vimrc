" Vim-plug configuration

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Show line numbers
set number
" Enable color theme
colorscheme nord
