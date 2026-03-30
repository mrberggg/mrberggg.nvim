if vim.g.vscode then return end

vim.pack.add { 'https://github.com/mikavilpas/yazi.nvim' }

require('yazi').setup { open_for_directories = true }

vim.keymap.set('n', '<leader>e', function()
  require('yazi').yazi()
end, { desc = 'Open the file manager' })
