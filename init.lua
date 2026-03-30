-- speed up load time by enabling experimental lua module loader
vim.loader.enable()

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Build hooks -- must be defined before any vim.pack.add() calls
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

-- [[ Include config files ]]
require 'core.options'

if vim.g.vscode then
  require 'core.keymaps-vscode'
else
  require 'core.keymaps'
  require 'core.autocommands'
end
