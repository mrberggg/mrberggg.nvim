return {
  {
    'williamboman/mason.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    cond = not vim.g.vscode,
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'cssls', 'eslint', 'html', 'jsonls', 'markdown_oxide', 'pyright', 'volar', 'vtsls' },
        automatic_installation = true,
      }
    end,
  },
}
