return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 50,
      direction = 'float',
    },
    keys = {
      { '<leader>m', '<CMD>ToggleTerm<CR>', desc = 'Toggle ter[m]inal' },
    },
  },
}
