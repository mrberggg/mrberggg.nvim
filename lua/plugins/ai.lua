return {
  {
    'github/copilot.vim',
    cond = not vim.g.vscode,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "ravitemer/mcphub.nvim"
    },
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
    },
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op read op://Private/ClaudeAPI/password --no-newline",
          },
        })
      end,
    },
    keys = {
      { "``", "<Cmd>CodeCompanionChat Toggle<CR>",    desc = "Code Companion Chat" },
      { "`c", "<Cmd>'<,'>CodeCompanion /commit<CR>",  desc = "Code Companion Commit Message" },
      { "`e", "<Cmd>'<,'>CodeCompanion /explain<CR>", desc = "Code Companion Explain" },
      { "`f", "<Cmd>'<,'>CodeCompanion /fix<CR>",     desc = "Code Companion Fix" },
      { "`l", "<Cmd>'<,'>CodeCompanion /lsp<CR>",     desc = "Code Companion Lsp" },
      { "`t", "<Cmd>'<,'>CodeCompanion /tests<CR>",   desc = "Code Companion Generate Tests" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },
}
