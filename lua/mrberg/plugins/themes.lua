return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    cond = not vim.g.vscode,
    config = function()
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      require('tiny-devicons-auto-colors').setup()
    end,
  },
}
