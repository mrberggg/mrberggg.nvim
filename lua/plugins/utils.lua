return {
  {
    'kylechui/nvim-surround',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'sQVe/sort.nvim',
    config = function()
      require('sort').setup({})
    end,
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
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
    },
  },
}
