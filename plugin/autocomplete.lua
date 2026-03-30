if vim.g.vscode then return end

vim.pack.add {
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },
  'https://github.com/nvim-mini/mini.pairs',
  'https://github.com/windwp/nvim-ts-autotag',
}

require('mini.pairs').setup {
  modes = { insert = true, command = true, terminal = false },
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  skip_ts = { 'string' },
  skip_unbalanced = true,
  markdown = true,
}

require('nvim-ts-autotag').setup {}

-- blink.cmp (already loaded via lsp.lua)
require('blink.cmp').setup {
  cmdline = {
    keymap = {
      preset = 'default',
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
    },
    completion = {
      ghost_text = { enabled = false },
      menu = { auto_show = true },
    },
  },
  completion = {
    menu = { border = 'single' },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
  },
  keymap = {
    preset = 'enter',
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
}
