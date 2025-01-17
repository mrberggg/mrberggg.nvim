return {
  'folke/snacks.nvim',
  cond = not vim.g.vscode,
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true, notify = true },
    dim = { enabled = true },
    dashboard = {
      enabled = true,
      -- enabled = false,
      preset = {
        keys = {
          {
            icon = ' ',
            key = 's',
            desc = 'Restore Session',
            action = ":lua require('persistence').load()",
          },
          {
            icon = ' ',
            key = 'f',
            desc = 'Find File',
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = ' ',
            key = 'r',
            desc = 'Recent Files',
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = '󰒲 ',
            key = 'u',
            desc = 'Update Plugins',
            action = ':Lazy update',
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
        { section = 'keys', gap = 1, padding = 3 },
        { section = 'startup' },
      },
    },
    indent = { enabled = false },
    input = { enabled = true },
    lazygit = { enabled = true },
    notify = { enabled = false },
    picker = {
      enabled = true,
    },
    profiler = { enabled = false },
    scope = {
      enabled = true,
      treesitter = {
        enabled = true,
      },
      keys = {
        jump = {
          ['['] = {
            min_size = 1, -- allow single line scopes
            bottom = false,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = 'jump to top edge of scope',
          },
          [']'] = {
            min_size = 1, -- allow single line scopes
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
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>rn',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>no',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '*',
      function()
        Snacks.words.jump(vim.v.count1, true)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '#',
      function()
        Snacks.words.jump(-vim.v.count1, true)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
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
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fk',
      function()
        Snacks.picker.keymaps()
      end,
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_status()
      end,
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.resume()
      end,
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.man()
      end,
    },
    {
      '<leader>fo',
      function()
        Snacks.picker.lsp_symbols()
      end,
    },
    {
      '<leader>fq',
      function()
        Snacks.picker.qflist()
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

        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>t;'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>ud'
        Snacks.input.enable()
      end,
    })
  end,
}
