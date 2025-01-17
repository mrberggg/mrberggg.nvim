return {
  {
    'f-person/git-blame.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'BufEnter',
    opts = {
      enabled = false,
    },
    keys = {
      { '<leader>gb', '<cmd>GitBlameToggle<CR>', desc = 'Toggle git blame' },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup()
    end,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
