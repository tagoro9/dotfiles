local cmd = vim.cmd
cmd 'packadd paq-nvim'
local paq = require('paq').paq

-- Plugin management
paq{'savq/paq-nvim', opt=true}

-- Reload nvim config easily with :Reload and :Restart
paq 'famiu/nvim-reload'

-- Better tree navigation
paq 'kyazdani42/nvim-web-devicons'
paq 'kyazdani42/nvim-tree.lua'

-- telescope
paq { 'nvim-lua/plenary.nvim' }
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-telescope/telescope.nvim' }
paq 'nvim-telescope/telescope-fzy-native.nvim'

-- lsp and completion
-- paq { 'kabouzeid/nvim-lspinstall' }
paq { 'neovim/nvim-lspconfig' }
paq { 'hrsh7th/nvim-compe' }
paq { 'glepnir/lspsaga.nvim' }
-- paq { 'simrat39/symbols-outline.nvim' }

-- auto pairs
paq { 'windwp/nvim-autopairs' }

-- tree sitter
paq { 'nvim-treesitter/nvim-treesitter' }
paq { 'nvim-treesitter/playground' }

-- Git
paq { 'tpope/vim-fugitive' }
paq { 'airblade/vim-gitgutter' }
paq { 'lewis6991/gitsigns.nvim' }

-- Powerline and themes
paq { 'vim-airline/vim-airline' }
paq { 'vim-airline/vim-airline-themes' }
paq { 'dracula/vim', as = 'dracula' }
paq { 'kyazdani42/nvim-web-devicons' }

-- language formatter
paq { 'sbdchd/neoformat' }

-- Show colors next to its value
paq { 'norcalli/nvim-colorizer.lua' }

-- Make it easier to comment out code
paq { 'terrortylor/nvim-comment' }
