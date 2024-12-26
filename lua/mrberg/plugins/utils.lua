return {
  {
    'tpope/vim-surround',
    lazy = true,
    event = 'BufEnter',
  },
  {
    'sQVe/sort.nvim',
    lazy = true,
    event = 'BufEnter',
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v4.1.0',
    lazy = true,
    event = 'BufEnter',
    config = true,
  },
  {
    'smoka7/hop.nvim',
    lazy = true,
    event = { 'BufEnter', 'BufNewFile' },
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = true,
    keys = {
      { "<Leader>'", '<Cmd>HopWord<CR>', desc = 'Hop word', mode = 'n' },
    },
  },
  {
    'folke/ts-comments.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'Goose97/timber.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('timber').setup()
    end,
  },
}
