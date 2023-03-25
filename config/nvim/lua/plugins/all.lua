require('plugins/airline')
require('plugins/treesitter')
-- require('plugins/lsp')
require('plugins/reload')
require('plugins/autopairs')

-- Allow to comment code
require'nvim_comment'.setup {
    line_mapping = "<leader>//",
    operator_mapping = "<leader>/"
}

require 'colorizer'.setup()

require'nvim-tree'.setup()

-- Highlight brackets, parenthesis and so on
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require('gitsigns').setup {
    numhl = true,
    current_line_blame = true,
    current_line_blame_formatter_opts = { relative_time = false },
}
