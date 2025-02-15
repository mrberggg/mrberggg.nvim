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

-- No unneeded borders around vim https://github.com/neovim/neovim/issues/16572#issuecomment-1954420136
local modified = false
vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    if normal.bg then
      io.write(string.format('\027]11;#%06x\027\\', normal.bg))
      modified = true
    end
  end,
})

-- Remove hack for unused borders
vim.api.nvim_create_autocmd('UILeave', {
  callback = function()
    if modified then
      io.write('\027]111\027\\')
    end
  end,
})
