vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>u', '<C-^>', { desc = 'Reopen previous buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>/', 'gcc', { desc = 'Comment', remap = true })

-- Diagnostics
vim.diagnostic.config({ virtual_text = false })

vim.keymap.set('n', '<leader>se', '<CMD>lua vim.diagnostic.config({virtual_text = true })<CR>',
  { desc = 'Show error virtual text' })
vim.keymap.set('n', '<leader>he', '<CMD>lua vim.diagnostic.config({virtual_text = false })<CR>',
  { desc = 'Hide error virtual text' })
