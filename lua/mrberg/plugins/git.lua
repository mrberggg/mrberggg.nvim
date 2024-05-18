return {
  {
    "f-person/git-blame.nvim",
    cond = not vim.g.vscode,
    lazy = true,
    event = "BufEnter",
    opts = {
      enabled = false,
    },
    keys = {
      { '<leader>gb', '<cmd>GitBlameToggle<CR>', desc = "Toggle git blame" },
    }
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = "BufEnter",
    config = function()
      require('gitsigns').setup()
    end,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim", },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<Cmd>LazyGit<CR>", desc = "LazyGit" },
    }
  },
  {
    "sindrets/diffview.nvim",
    cond = not vim.g.vscode,
    lazy = true,
    setup = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        view = {
          merge_tool = {
            layout = "diff3_horizontal",
            winbar_info = true,
            disable_diagnostics = true,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()
          if view then
            vim.cmd.DiffviewClose()
          else
            vim.cmd.DiffviewOpen()
          end
        end,
        desc = "Diffview",
      },
    },
  },
}
