if vim.g.vscode then return end

vim.pack.add { 'https://github.com/folke/persistence.nvim' }

require('persistence').setup {}
