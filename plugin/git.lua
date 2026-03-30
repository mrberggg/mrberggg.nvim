if vim.g.vscode then return end

vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

require('gitsigns').setup { current_line_blame = true }

-- Navigation
vim.keymap.set('n', ']]', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']]', bang = true })
  else
    require('gitsigns').nav_hunk('next')
  end
end, { desc = 'Git next hunk' })

vim.keymap.set('n', '[[', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[[', bang = true })
  else
    require('gitsigns').nav_hunk('prev')
  end
end, { desc = 'Git prev hunk' })

-- Diffs
vim.keymap.set('n', '<leader>gd', "<CMD>lua require('gitsigns').diffthis()<CR>", { desc = 'Git diff this' })
vim.keymap.set('n', '<leader>gw', '<CMD>Gitsigns toggle_word_diff<CR>', { desc = 'Git toggle word diff' })
vim.keymap.set('n', '<leader>g-', '<CMD>Gitsigns toggle_deleted<CR>', { desc = 'Git toggle deleted' })
vim.keymap.set('n', '<leader>gp', '<CMD>Gitsigns preview_hunk<CR>', { desc = 'Git preview hunk' })

-- Manage hunks
vim.keymap.set('n', '<leader>gs', '<CMD>Gitsigns stage_hunk<CR>', { desc = 'Git stage hunk' })
vim.keymap.set('n', '<leader>gr', '<CMD>Gitsigns reset_hunk<CR>', { desc = 'Git reset hunk' })
vim.keymap.set('n', '<leader>gS', '<CMD>Gitsigns stage_buffer<CR>', { desc = 'Git stage buffer' })
vim.keymap.set('n', '<leader>gR', '<CMD>Gitsigns reset_buffer<CR>', { desc = 'Git reset buffer' })

-- Quickfix & blame
vim.keymap.set('n', '<leader>gq', function() require('gitsigns').setqflist('all') end,
  { desc = 'Add all modified files to QF list' })
vim.keymap.set('n', '<leader>gb', function() require('gitsigns').blame_line({ full = true }) end,
  { desc = 'Git blame line' })
vim.keymap.set('n', '<leader>gB', function() require('gitsigns').blame() end, { desc = 'Git blame buffer' })
