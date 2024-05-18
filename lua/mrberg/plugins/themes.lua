return {
  {
    "catppuccin/nvim",
    cond = not vim.g.vscode,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato",
    }
  },
  {
    "folke/tokyonight.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm"
    }
  },
  { "rebelot/kanagawa.nvim",    cond = not vim.g.vscode, lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", cond = not vim.g.vscode, lazy = false, priority = 1000 },
  {
    "zaldih/themery.nvim",
    cond = not vim.g.vscode,
    opts = {
      themes = { "catppuccin", "kanagawa", "tokyonight", "gruvbox" },
      themeConfigFile = "~/.config/nvim/lua/mrberg/core/theme.lua",
      livePreview = true,
    },
    keys = {
      { "<leader>ts", "<cmd>Themery<CR>" },
    },
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
      require('tiny-devicons-auto-colors').setup()
    end
  }
}
