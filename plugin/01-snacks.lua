if vim.g.vscode then return end

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  bigfile = { enabled = true, notify = true },
  quickfile = { enabled = true, notify = true },
  dim = { enabled = false },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        {
          icon = ' ',
          key = 's',
          desc = 'Restore Session',
          action = ":lua require('persistence').load()",
        },
        {
          icon = '  ',
          key = 'u',
          desc = 'Update Plugins',
          action = ':lua vim.pack.update()',
        },
        {
          icon = ' ',
          key = 'm',
          desc = 'Mason',
          action = ':Mason',
        },
        {
          icon = ' ',
          key = 'c',
          desc = 'Config',
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        },
        {
          icon = ' ',
          key = 'q',
          action = ':qa',
          desc = 'Quit',
        },
      },
    },
    sections = {
      { section = 'header', padding = 4 },
      { section = 'keys',   gap = 1,    padding = 3 },
    },
  },
  indent = { enabled = false },
  lazygit = { enabled = true },
  notifier = { enabled = true },
  explorer = { enabled = true },
  picker = { enabled = true },
  profiler = { enabled = false },
  scope = {
    enabled = true,
    treesitter = {
      enabled = true,
    },
    keys = {
      jump = {
        ['('] = {
          min_size = 1,
          bottom = false,
          cursor = false,
          edge = true,
          treesitter = { blocks = { enabled = false } },
          desc = 'jump to top edge of scope',
        },
        [')'] = {
          min_size = 1,
          bottom = true,
          cursor = false,
          edge = true,
          treesitter = { blocks = { enabled = false } },
          desc = 'jump to bottom edge of scope',
        },
      },
    },
  },
  scratch = { enabled = false },
  scroll = {
    enabled = true,
    animate = {
      duration = { step = 15, total = 250 },
      easing = 'outQuint',
    },
  },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

-- Debug globals
_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

-- Toggles
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>;')

-- Keymaps
vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Lazygit' })
vim.keymap.set('n', '<leader><leader>', function()
  Snacks.picker.buffers({
    win = {
      input = {
        keys = {
          ['<c-l>'] = { 'bufdelete', mode = { 'n', 'i' } },
        },
      },
    },
    mode = 'normal',
  })
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>/', function() Snacks.picker.grep() end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>:', function() Snacks.picker.command_history() end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.smart() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics_buffer({ severity = 'ERROR' }) end,
  { desc = 'Show diagnostics' })
vim.keymap.set('n', '<leader>fk', function() Snacks.picker.keymaps() end, { desc = 'Show keymaps' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.git_status() end, { desc = 'Show modified files' })
vim.keymap.set('n', '<leader>fr', function() Snacks.picker.resume() end, { desc = 'Resume last search' })
vim.keymap.set('n', '<leader>fq', function() Snacks.picker.qflist() end, { desc = 'Quickfix list' })
vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end)
vim.keymap.set('n', '<leader>E', function() Snacks.explorer.open() end)
