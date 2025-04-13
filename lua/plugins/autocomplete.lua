return {
  {
    'echasnovski/mini.pairs',
    cond = not vim.g.vscode,
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
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
      cmdline = {
        keymap = {
          preset = 'default',
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-k>'] = { 'select_prev', 'fallback' },
        },
        completion = {
          ghost_text = { enabled = false },
          menu = { auto_show = true }
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
    },
    opts_extend = { 'sources.default' },
  },
}
