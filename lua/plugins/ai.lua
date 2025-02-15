return {
  {
    'github/copilot.vim',
    cond = not vim.g.vscode,
    lazy = true,
    event = {
      'InsertEnter',
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require('codecompanion').setup({
  --       opts = {
  --         log_level = "DEBUG"
  --       },
  --       strategies = {
  --         chat = {
  --           adapter = 'copilot',
  --         },
  --         inline = {
  --           adapter = 'copilot',
  --         },
  --       },
  --     })
  --   end
  -- }
}
