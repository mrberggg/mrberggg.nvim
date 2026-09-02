if vim.g.vscode then return end

vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

-- oxlint applies its safe lint fixes, then oxfmt does the actual formatting.
-- conform runs them in order, so oxfmt always gets the last word.
local oxc = { 'oxlint', 'oxfmt' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    javascript = oxc,
    javascriptreact = oxc,
    typescript = oxc,
    typescriptreact = oxc,
    vue = oxc,
  },
  format_on_save = { timeout_ms = 1000, lsp_format = 'fallback' },
}
