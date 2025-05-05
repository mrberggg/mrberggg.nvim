return {
  'folke/snacks.nvim',
  cond = not vim.g.vscode,
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true, notify = true },
    quickfile = { enabled = true, notify = true },
    dim = { enabled = false },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          {
            icon = ' ',
            key = 's',
            desc = 'Restore Session',
            action = ":lua require('persistence').load()",
          },
          {
            icon = '󰒲 ',
            key = 'u',
            desc = 'Update Plugins',
            action = ':Lazy update',
          },
          {
            icon = '󰣪 ',
            key = 'm',
            desc = 'Mason',
            action = ':Mason',
          },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = ' ',
            key = 'q',
            action = ':qa',
            desc = ' Quit',
          },
        },
      },
      sections = {
        { section = 'header', padding = 4 },
        { section = 'keys',   gap = 1,    padding = 3 },
        { section = 'startup' },
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
            min_size = 1, -- allow single line scopes
            bottom = false,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = 'jump to top edge of scope',
          },
          [')'] = {
            min_size = 1, -- allow single line scopes
            bottom = true,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = 'jump to bottom edge of scope',
          },
        }
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
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers {
          win = {
            input = {
              keys = {
                ['<c-l>'] = { 'bufdelete', mode = { 'n', 'i' } },
              },
            },
          },
          mode = 'normal',
        }
      end,
      desc = 'Buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Find files',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics_buffer({
          severity = 'ERROR',
        })
      end,
      desc = 'Show diagnostics'
    },
    {
      '<leader>fk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Show keymaps'
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Show modified files'
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume last search'
    },
    {
      '<leader>fo',
      function()
        Snacks.picker.treesitter()
      end,
      desc = 'Find symbols'
    },
    {
      '<leader>fq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix list'
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
    },
    {
      '<leader>E',
      function()
        Snacks.explorer.open()
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>;'
      end,
    })
  end,
}
