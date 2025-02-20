return {
  {
    'nvim-treesitter/nvim-treesitter',
    cond = not vim.g.vscode,
    event = 'VeryLazy',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'javascript', 'json', 'tsx', 'regex', 'vue' },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '-',
          node_incremental = '-',
          scope_incremental = false,
          node_decremental = '_',
        },
      },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
