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
}
