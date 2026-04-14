if vim.g.vscode then return end

vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

local eslint_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
  },
  format_on_save = function(bufnr)
    -- Let the ESLint LSP handle TS/JS via BufWritePre below so that save
    -- formatting matches :LspEslintFixAll exactly.
    if eslint_filetypes[vim.bo[bufnr].filetype] then return nil end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end,
}

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('eslint-fix-on-save', { clear = true }),
  callback = function(args)
    if not eslint_filetypes[vim.bo[args.buf].filetype] then return end
    local clients = vim.lsp.get_clients { bufnr = args.buf, name = 'eslint' }
    if #clients == 0 then return end
    vim.cmd('LspEslintFixAll')
  end,
})
