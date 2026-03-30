if vim.g.vscode then return end

vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/noice.nvim',
  'https://github.com/brenoprata10/nvim-highlight-colors',
  'https://github.com/petertriho/nvim-scrollbar',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/romgrk/barbar.nvim',
  'https://github.com/kevinhwang91/nvim-bqf',
  'https://github.com/stevearc/quicker.nvim',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/sschleemilch/slimline.nvim',
  'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
}

require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        any = {
          { find = '%d+L, %d+B' },
          { find = '; after #%d+' },
          { find = '; before #%d+' },
        },
      },
      view = 'mini',
    },
  },
  presets = {
    command_palette = true,
    long_message_to_split = true,
    bottom_search = true,
    lsp_doc_border = true,
  },
}

require('nvim-highlight-colors').setup {
  render = 'virtual',
  virtual_symbol = '■',
  virtual_symbol_position = 'inline',
  enable_hex = true,
  enable_rgb = true,
  enable_var_usage = true,
  enable_named_colors = true,
}

require('scrollbar').setup {}

require('barbar').setup {
  exclude_ft = { 'terminal' },
}

require('quicker').setup {}
require('trouble').setup {}
require('slimline').setup {}

require('tiny-inline-diagnostic').setup {
  preset = 'classic',
}
vim.diagnostic.config({ virtual_text = false })

-- Barbar keymaps
vim.keymap.set('n', '<leader>h', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>l', '<Cmd>BufferNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>X', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close all but current buffer' })
vim.keymap.set('n', '<leader>xh', '<Cmd>BufferCloseBuffersLeft<CR>', { desc = 'Close all buffers to the left' })
vim.keymap.set('n', '<leader>xl', '<Cmd>BufferCloseBuffersRight<CR>', { desc = 'Close all buffers to the right' })
vim.keymap.set('n', '<leader>b', '<Cmd>BufferPick<CR>', { desc = 'Pick buffer' })
vim.keymap.set('n', '<leader>B', '<Cmd>BufferPickDelete<CR>', { desc = 'Pick buffer to delete' })
