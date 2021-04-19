" Vim-plug configuration

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'

call plug#end()

" Set theme
let g:airline_theme='one'
colorscheme one
set background=light

syntax on

" Show line numbers
set number

set exrc " .vimrc in local project dir
set secure

" Enable 256 colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

