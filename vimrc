" Vim-plug configuration

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Enable color theme
colorscheme nord

" Show line numbers
set number

" Enable 256 colors
if (has("termguicolors"))
  set termguicolors
endif

