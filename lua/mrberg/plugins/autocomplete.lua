return {
  {
    'windwp/nvim-autopairs',
    cond = not vim.g.vscode,
    event = 'InsertEnter',
    config = true,
  },
  {
    'windwp/nvim-ts-autotag',
    cond = not vim.g.vscode,
    lazy = true,
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      completion = {
        list = {
          selection = 'manual'
        }
      },

      keymap = {
        preset = 'enter',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  }
}
