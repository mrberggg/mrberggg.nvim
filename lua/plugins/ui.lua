return {
  {
    'folke/noice.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        bottom_search = true,
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      }
    }
  },
  {
    'brenoprata10/nvim-highlight-colors',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('nvim-highlight-colors').setup {
        render = 'virtual',
        virtual_symbol = '■',
        virtual_symbol_position = 'inline',
        enable_hex = true,
        enable_rgb = true,
        enable_var_usage = true,
        enable_named_colors = true,
      }
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    cond = not vim.g.vscode,
    event = 'VeryLazy',
    config = function()
      require('scrollbar').setup()
    end,
  },
  {
    'romgrk/barbar.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      map('n', '<leader>h', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<leader>l', '<Cmd>BufferNext<CR>', opts)

      -- Close
      map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
      map('n', '<leader>X', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
      map('n', '<leader>xh', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
      map('n', '<leader>xl', '<Cmd>BufferCloseBuffersRight<CR>', opts)
      map('n', '<leader>b', '<Cmd>BufferPick<CR>', opts)
      map('n', '<leader>B', '<Cmd>BufferPickDelete<CR>', opts)
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    cond = not vim.g.vscode,
  },
  {
    'folke/trouble.nvim',
    cond = not vim.g.vscode,
    opts = {},
  }
}
