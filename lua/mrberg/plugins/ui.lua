return {
  {
    'folke/noice.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
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
    'akinsho/bufferline.nvim',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'BufEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
    opts = {
      options = {
        separator_style = 'slant',
        diagnostice = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ''
          return ' ' .. icon .. count
        end,
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    cond = not vim.g.vscode,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require 'lualine'
      -- configure lualine with modified theme
      lualine.setup {
        options = {
          theme = 'catppuccin',
          icons_enabled = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
          lualine_c = {
            {
              'filename',
              file_status = true, -- Displays file status (readonly status, modified status)
              newfile_status = false, -- Display new file status (new file means no write after created)
              path = 4, -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              -- shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = '[+]', -- Text to show when the file is modified.
                readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '[New]', -- Text to show for newly created file before first write
              },
            },
          },
          lualine_x = { 'filetype' },
          -- lualine_x = { { "searchcount", maxcount = 999, timeout = 500 }, "selectioncount" },
          -- lualine_y = { "progress" },
          -- lualine_z = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
  {
    'onsails/lspkind.nvim',
    lazy = true,
    cond = not vim.g.vscode,
    enabled = vim.g.icons_enabled ~= false,
    opts = {
      mode = 'symbol',
      symbol_map = {
        Array = '󰅪',
        Boolean = '⊨',
        Class = '󰌗',
        Constructor = '',
        Key = '󰌆',
        Namespace = '󰅪',
        Null = 'NULL',
        Number = '#',
        Object = '󰀚',
        Package = '󰏗',
        Property = '',
        Reference = '',
        Snippet = '',
        String = '󰀬',
        TypeParameter = '󰊄',
        Unit = '',
      },
      menu = {},
    },
    config = function(...)
      require 'astronvim.plugins.configs.lspkind'(...)
    end,
  },
  { 'dmmulroy/ts-error-translator.nvim', cond = not vim.g.vscode },
  {
    'petertriho/nvim-scrollbar',
    cond = not vim.g.vscode,
    event = 'VeryLazy',
    config = function()
      require('scrollbar').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    cond = not vim.g.vscode,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<Leader>x', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Trouble Toggle' },
      { '<Leader>X', '<Cmd>Trouble diagnostics toggle<CR>', desc = 'Trouble Toggle Project' },
      { '<leader>Q', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
  },
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    cond = not vim.g.vscode,
    config = function()
      require('incline').setup {
        render = 'basic',
      }
    end,
  },
  {
    'romgrk/barbar.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<leader>h', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<leader>l', '<Cmd>BufferNext<CR>', opts)

      -- Close
      map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
      map('n', '<leader>C', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
      map('n', '<leader>cl', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
      map('n', '<leader>cr', '<Cmd>BufferCloseBuffersRight<CR>', opts)

      map('n', '<leader><leader>', '<Cmd>BufferPick<CR>', opts)
      map('n', '<leader>B', '<Cmd>BufferPickDelete<CR>', opts)
    end,
  },
  { 'tiagovla/scope.nvim', config = true }, -- isolate buffers to tabs
}
