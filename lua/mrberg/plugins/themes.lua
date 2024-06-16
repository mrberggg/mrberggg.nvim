return {
  {
    'vague2k/huez.nvim',
    -- if you want registry related features, uncomment this
    import = 'huez-manager.import',
    branch = 'stable',
    event = 'UIEnter',
    config = function()
      require('huez').setup {}
      local pickers = require 'huez.pickers'

      vim.keymap.set('n', '<leader>ft', pickers.themes, {})
      -- vim.keymap.set('n', '<leader>cof', pickers.favorites, {})
      vim.keymap.set('n', '<leader>fnt', pickers.live, {})
      -- vim.keymap.set('n', '<leader>coe', pickers.ensured, {})
    end,
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      require('tiny-devicons-auto-colors').setup()
    end,
  },
}
