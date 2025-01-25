-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically format the buffer before saving
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function() vim.lsp.buf.format() end,
})
