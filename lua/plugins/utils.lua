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
        ';',
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
}
