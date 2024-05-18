return {
  'stevearc/oil.nvim',
  cond = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require('oil').setup()
  end,
  opts = {},
  keys = {
    { '<leader>o', '<cmd>Oil<CR>', desc = 'Open Oil' },
  }
}
