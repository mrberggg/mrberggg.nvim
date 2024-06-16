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
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>e',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open the file manager',
      },
      {
        -- Open in the current working directory
        '<leader>-',
        function()
          require('yazi').yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open the file manager in nvim's working directory",
      },
    },
    opts = {
      open_for_directories = true,
    },
  },
}
