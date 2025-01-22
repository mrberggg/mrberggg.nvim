return {
  {
    'mikavilpas/yazi.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('yazi').setup()
    end,
    keys = {
      {
        '<leader>e',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open the file manager',
      },
    },
    opts = {
      open_for_directories = true,
    },
  },
}
