local map = vim.api.nvim_set_keymap
local globals = vim.g

-- map the leader key
map('n', '<Space>', '', {})
globals.mapleader = ' '

options = { noremap = true }
map('n', '<M-j>', ':nohlsearch<cr>', options)

-- alt + hjkl to resize windows in normal mode
-- in mac we have to use the generated symbols hjkl maps to ˙∆˚¬
map('n', '˙',  ':vertical resize -2<CR>', options)
map('n', '∆',  ':resize -2<CR>', options)
map('n', '˚',  ':resize +2<CR>', options)
map('n', '¬',  ':vertical resize +2<CR>', options)

-- alt + hjkl in isert mode act as arrows
map('i', '˙', '<Left>', options)
map('i', '∆', '<Down>', options)
map('i', '˚', '<Up>', options)
map('i', '¬', '<Right>', options)

-- Move lines more easily
map('n', 'J', ':m+1<CR>', options)
map('n', 'K', ':m-2<CR>', options)
map('v', 'J', ':m \'>+1<CR>gv=gv', options)
map('v', 'K', ':m \'<-2<CR>gv=gv', options)

map('n', '<C-n>', ':NvimTreeToggle<CR>', options)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', options)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', options)

-- ctrl + hjkl to move between windows in normal mode
map('n', '<C-h>',  '<C-w>h', options)
map('n', '<C-j>',  '<C-w>j', options)
map('n', '<C-k>',  '<C-w>k', options)
map('n', '<C-l>',  '<C-w>l', options)

-- Telescope command-line sugar
map('n', '<leader>ff',  '<cmd>Telescope find_files<CR>', options)
map('n', '<leader>fe',  '<cmd>:lua require("telescope.builtin").file_browser{cwd = require("telescope.utils").buffer_dir()}<CR>', options)
map('n', '<leader>fg',  '<cmd>Telescope live_grep<CR>', options)
map('n', '<leader>fb',  '<cmd>Telescope buffers<CR>', options)
map('n', '<leader>fh',  '<cmd>Telescope help_tags<CR>', options)

-- [jk | kl] instead of ESC in insert mode
map('i', 'jk' , '<ESC>', options)
map('i', 'kj' , '<ESC>', options)

-- Don't use arrow keys in  insert mode
map('i', '<up>', '<nop>', options)
map('i', '<down>', '<nop>', options)
map('i', '<left>', '<nop>', options)
map('i', '<right>', '<nop>', options)

-- Completion
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

-- lsp provider to find the cursor word definition and reference
map('n', 'gh', ':lua require("lspsaga.provider").lsp_finder()<CR>', {noremap = true, silent = true})
map('n', '<leader>ca', ':lua require("lspsaga.codeaction").code_action()<CR>', {noremap = true, silent = true})
-- map('n', 'K', '<cmd>:lua require("lspsaga.hover").render_hover_doc()<CR>', {noremap = true, silent = true})
map('n', '[e', '<cmd>:lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', {noremap = true, silent = true})
map('n', ']e', '<cmd>:lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', {noremap = true, silent = true})
