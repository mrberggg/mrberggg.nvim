local vscode = require 'vscode'

-- Save
vim.keymap.set('n', '<leader>w', function()
  vscode.call 'workbench.action.files.save'
end, { desc = 'Save file' })
-- Open error
vim.keymap.set('n', '<leader>fd', function()
  vscode.call 'workbench.action.showErrorsWarnings'
end, { desc = 'Show errors warnings' })

vim.keymap.set('n', '<leader>ff', function()
  vscode.call 'workbench.action.quickOpen'
end, { desc = 'Find file' })

vim.keymap.set('n', 'grn', function()
  vscode.call 'editor.action.rename'
end, { desc = 'rename' })

vim.keymap.set('n', '<leader>;', '<Cmd>set invrelativenumber<CR>', { desc = 'Toggle relative numbers' })

vim.opt.swapfile = false
