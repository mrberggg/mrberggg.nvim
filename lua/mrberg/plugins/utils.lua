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
    event = 'BufReadPre',
    config = true,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    config = true,
    opts = {},
    keys = {
      {
        "<leader>'",
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
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
