local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- global options
o.splitbelow = true
o.splitright = true
o.guicursor = ''
o.termguicolors = true -- icons are not displayed with the correct colors
o.showmode = false
o.incsearch = true
o.hlsearch = false
o.hidden = true
o.scrolloff=8
o.completeopt = "menuone,noselect"
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth =  2
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
o.updatetime = 50

-- buffer-local options
bo.expandtab = true
bo.smartindent = true
bo.tabstop = 2
bo.softtabstop = 2
bo.shiftwidth =  2

-- window-local options
wo.wrap = false
wo.relativenumber = true
