if vim.g.vscode then return end

vim.pack.add { 'https://github.com/folke/which-key.nvim' }

local wk = require 'which-key'

wk.add {
  { '<leader>a', group = '[A]I' },
  { '<leader>f', group = '[F]ind' },
  { '<leader>s', group = 'L[s]p' },
  { '<leader>g', group = '[G]it' },
  { '<leader>t', group = '[T]est' },
}
