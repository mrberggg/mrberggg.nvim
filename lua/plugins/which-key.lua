return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  cond = not vim.g.vscode,
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'

    wk.add {
      { '<leader>a', group = '[A]I' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>s', group = 'L[s]p' },
      { '<leader>g', group = '[G]it' },
      { '<leader>t', group = '[T]est' },
    }
  end,
}
