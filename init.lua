-- speed up load time by enabling experimental lua module loader
vim.loader.enable()

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Include config files ]]
require 'core.options'

if vim.g.vscode then
  require 'core.keymaps-vscode'
else
  require 'core.keymaps'
  require 'core.autocommands'
end
