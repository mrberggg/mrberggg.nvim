return {
  {
    'github/copilot.vim',
    cond = not vim.g.vscode,
  },
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").toggle({ focus = true }) end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      {
        "<c-,>",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
    },
  }
}
