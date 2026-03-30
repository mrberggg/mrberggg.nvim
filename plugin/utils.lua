vim.pack.add {
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/sQVe/sort.nvim',
  'https://github.com/gregorias/coop.nvim',
  { src = 'https://github.com/gregorias/coerce.nvim', version = 'v4.1.0' },
  'https://github.com/folke/flash.nvim',
}

require('nvim-surround').setup {}
require('sort').setup {}
require('coerce').setup {}

require('flash').setup {
  highlight = {
    backdrop = false,
  },
  jump = {
    autojump = true,
    nohlsearch = true,
  },
  modes = {
    char = {
      char_actions = function()
        return {
          [';'] = 'next',
          ['F'] = 'left',
          ['f'] = 'right',
        }
      end,
      enabled = true,
      keys = { 'f', 'F', 't', 'T', ';' },
      highlight = {
        backdrop = false,
      },
      jump_labels = false,
      multi_line = true,
    },
    search = {
      enabled = true,
      highlight = {
        backdrop = false,
      },
      jump = {
        autojump = false,
      },
    },
  },
  prompt = {
    win_config = { border = 'none' },
  },
  search = {
    wrap = true,
  },
}
