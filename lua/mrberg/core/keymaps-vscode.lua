local vscode = require('vscode')

-- Save
vim.keymap.set('n', '<leader>w', function()
  vscode.call('workbench.action.files.save')
end, { desc = 'Save file' })
-- Open error
vim.keymap.set('n', '<leader>xx', function()
  vscode.call('workbench.action.showErrorsWarnings')
end, { desc = 'Show errors warnings' })

vim.keymap.set('n', '<leader>ff', function()
  vscode.call('workbench.action.quickOpen')
end, { desc = 'Find file' })

vim.keymap.set('n', '<leader>rn', function()
  vscode.call('editor.action.rename')
end, { desc = 'Find in files' })
