return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  cond = not vim.g.vscode,
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'

    wk.add {
      { '<leader>f', group = '[F]ind' },
      { '<leader>l', group = '[L]sp' },
      { '<leader>x', group = '[X]ebug' },
      { '<leader>g', group = '[G]it' },
    }
  end,
}
