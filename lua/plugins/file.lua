return {
  {
    'mikavilpas/yazi.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-lua/plenary.nvim',
      "folke/snacks.nvim",
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
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function(opts)
      require("oil").setup {
        default_file_explorer = false,
        columns = {
          "icon",
        },
        lsp_file_methods = {
          -- Enable or disable LSP file operations
          enabled = true,
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 10000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = 'unmodified',
        },
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["-"] = { "actions.parent", mode = "n" },
          ["g."] = { "actions.toggle_hidden", mode = "n" },
        },
      }
    end,
    keys = {
      {
        '<leader>`',
        function()
          require("oil").toggle_float()
        end,
        desc = 'Toggle Oil'
      }
    }
  },
}
