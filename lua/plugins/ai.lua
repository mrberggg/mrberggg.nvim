return {
  {
    "yetone/avante.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      'github/copilot.vim',
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    event = "VeryLazy",
    lazy = true,
    build = "make",
    cmds = {
      "AvanteAsk",
      "AvanteEdit",
      "AvanteRefresh",
    },
    opts = {
      provider = "copilot",
      copilot = {
        hide_in_model_selector = true,
      },
      file_selector = {
        provider = "snacks",
        provider_opts = {},
      },
      behavior = {
        auto_suggestions = false,
      },
      windows = {
        ask = {
          floating = true,
        },
      },
    },
  }
}
