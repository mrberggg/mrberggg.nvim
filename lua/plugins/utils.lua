return {
  {
    'kylechui/nvim-surround',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'sQVe/sort.nvim',
    config = function()
      require('sort').setup({})
    end,
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v4.1.0',
    event = 'BufReadPre',
    config = true,
  },
  {
    "folke/flash.nvim",
    opts = {
      highlight = {
        backdrop = false,
      },
      jump = {
        autojump = true,
        nohlsearch = true,
      },
      -- labels = "asdfqwerzxcv", -- Limit labels to left side of the keyboard
      modes = {
        char = {
          char_actions = function()
            return {
              [";"] = "next",
              ["F"] = "left",
              ["f"] = "right",
            }
          end,
          enabled = true,
          keys = { "f", "F", "t", "T", ";" },
          highlight = {
            backdrop = false,
          },
          jump_labels = false,
          multi_line = true,
        },
        search = {
          enabled = true,
          highlight = {
            backdrop = false,
          },
          jump = {
            autojump = false,
          },
        },
      },
      prompt = {
        win_config = { border = "none" },
      },
      search = {
        wrap = true,
      },
    },
  }

  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   ---@type Flash.Config
  --   config = function()
  --     require('flash').setup({
  --       modes = {
  --         search = {
  --           enabled = false,
  --         },
  --         char = {
  --           enabled = false,
  --         },
  --       },
  --     })
  --   end,
  --   opts = {},
  --   keys = {
  --     {
  --       "'",
  --       mode = { 'n', 'x', 'o' },
  --       function()
  --         require('flash').jump()
  --       end,
  --       desc = 'Flash',
  --     },
  --   },
  -- },
}
