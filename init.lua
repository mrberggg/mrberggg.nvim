vim.loader.enable()
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Configure and install plugins ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  import = 'mrberg.plugins',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- [[ Include config files ]]
require 'mrberg.core.options'
require 'mrberg.core.autocommands'
require 'mrberg.core.keymaps'

if vim.g.vscode then
  require 'mrberg.core.keymaps-vscode'
end

-- TODO:
-- coerce nvim
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/mrjones2014/smart-splits.nvim
-- https://github.com/omerxx/tmux-sessionx
--
-- https://github.com/marilari88/neotest-vitest?tab=readme-ov-file
-- https://github.com/Wansmer/treesj
-- https://github.com/stevearc/aerial.nvim
-- https://github.com/rafcamlet/nvim-luapad
-- https://github.com/tpope/vim-unimpaired
