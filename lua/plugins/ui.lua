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
    lazy = false,
    opts = {},
    keys = {
      { '<leader>h',  '<Cmd>BufferPrevious<CR>',           { desc = 'Previous buffer' } },
      { '<leader>l',  '<Cmd>BufferNext<CR>',               { desc = 'Next buffer' } },
      { '<leader>x',  '<Cmd>BufferClose<CR>',              { desc = 'Close buffer' } },
      { '<leader>X',  '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close all but current buffer' } },
      { '<leader>xh', '<Cmd>BufferCloseBuffersLeft<CR>',   { desc = 'Close all buffers to the left' } },
      { '<leader>xl', '<Cmd>BufferCloseBuffersRight<CR>',  { desc = 'Close all buffers to the right' } },
      { '<leader>b',  '<Cmd>BufferPick<CR>',               { desc = 'Pick buffer' } },
      { '<leader>B',  '<Cmd>BufferPickDelete<CR>',         { desc = 'Pick buffer to delete' } },
    }
  },
  {
    'kevinhwang91/nvim-bqf',
    cond = not vim.g.vscode,
  },
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    'folke/trouble.nvim',
    cond = not vim.g.vscode,
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    cond = not vim.g.vscode,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = "classic",
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
}
