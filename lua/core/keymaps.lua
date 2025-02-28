vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>q', '<CMD>q<CR>', { desc = 'Close window' })
vim.keymap.set('n', '<leader>Q', '<CMD>qall<CR>', { desc = 'Close all' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>p', '<C-^>', { desc = 'Reopen previous buffer' })
vim.keymap.set('n', '<leader>P', '<CMD>wincmd p | q<CR>', { desc = 'Reopen previous window' })

vim.keymap.set({ 'n', 'v' }, '<leader>o', 'gcc', { desc = 'Comment', remap = true })

vim.keymap.set('n', '|', '<C-w>v', { desc = 'Split window' })

vim.keymap.set('n', '<leader>i', '<Cmd>echo fnamemodify(expand("%"), ":~:.")<CR>', { desc = 'Present directory' })
