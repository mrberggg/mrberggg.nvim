if vim.g.vscode then return end

vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
}

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
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
}
