return {
  {
    'vague2k/huez.nvim',
    cond = not vim.g.vscode,
    priority = 1000,
    -- if you want registry related features, uncomment this
    import = 'huez-manager.import',
    branch = 'stable',
    event = 'UIEnter',
    config = function()
      require('huez').setup {}
      local pickers = require 'huez.pickers'

      vim.keymap.set('n', '<leader>ft', pickers.themes, {})
      vim.keymap.set('n', '<leader>ftf', pickers.favorites, {})
      vim.keymap.set('n', '<leader>ftn', pickers.live, {})
      vim.keymap.set('n', '<leader>fte', pickers.ensured, {})
    end,
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      require('tiny-devicons-auto-colors').setup()
    end,
  },
}
