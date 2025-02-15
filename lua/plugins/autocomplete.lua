return {
  {
    'windwp/nvim-autopairs',
    cond = not vim.g.vscode,
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = { 'snacks_picker_list' },
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    cond = not vim.g.vscode,
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
  {
    'saghen/blink.cmp',
    cond = not vim.g.vscode,
    version = '*',
    opts = {
      completion = {
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
    },
    opts_extend = { 'sources.default' },
  },
}
