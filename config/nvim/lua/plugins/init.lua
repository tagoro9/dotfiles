local cmd = vim.cmd
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

paq{'savq/paq-nvim', opt=true}
paq { 'dracula/vim', as = 'dracula' }
paq { 'nvim-lua/plenary.nvim' }
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-telescope/telescope.nvim' }
paq { 'nvim-treesitter/nvim-treesitter' }
paq { 'vim-airline/vim-airline' }
paq { 'vim-airline/vim-airline-themes' }
paq { 'tpope/vim-fugitive' }
paq { 'kyazdani42/nvim-web-devicons' }
paq { 'neovim/nvim-lspconfig' }
paq { 'kabouzeid/nvim-lspinstall' }
paq { 'nvim-lua/completion-nvim' }

