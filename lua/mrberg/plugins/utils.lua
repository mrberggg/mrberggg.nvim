return {
  {
    'LunarVim/bigfile.nvim',
    lazy = true,
    cond = not vim.g.vscode,
    event = 'BufRead',
  },
  {
    'tpope/vim-surround',
    lazy = true,
    event = 'BufEnter',
  },
  {
    'sQVe/sort.nvim',
    lazy = true,
    event = 'BufEnter',
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v1.0',
    lazy = true,
    event = 'BufEnter',
    config = true,
  },
  {
    'smoka7/hop.nvim',
    lazy = true,
    event = { 'BufEnter', 'BufNewFile' },
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = true,
    keys = {
      { "<Leader>'", '<Cmd>HopWord<CR>', desc = 'Hop word', mode = 'n' },
    },
  },
  {
    'folke/ts-comments.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'famiu/bufdelete.nvim',
    cmd = 'Bdelete',
    keys = {
      { '<Leader>c', '<Cmd>Bdelete<CR>', desc = 'Close buffer', mode = 'n' },
      {
        '<Leader>q',
        function()
          vim.cmd 'qa'
        end,
        desc = 'Close all buffers',
        mode = 'n',
      },
    },
  },
  {
    'tris203/precognition.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = {
      startVisible = true,
      showBlankVirtLine = true,
      highlightColor = { link = 'Comment' },
      hints = {
        Caret = { text = '^', prio = 2 },
        Dollar = { text = '$', prio = 1 },
        MatchingPair = { text = '%', prio = 5 },
        Zero = { text = '0', prio = 1 },
        w = { text = 'w', prio = 10 },
        b = { text = 'b', prio = 9 },
        e = { text = 'e', prio = 8 },
        W = { text = 'W', prio = 7 },
        B = { text = 'B', prio = 6 },
        E = { text = 'E', prio = 5 },
      },
      gutterHints = {
        G = { text = 'G', prio = 10 },
        gg = { text = 'gg', prio = 9 },
        PrevParagraph = { text = '{', prio = 8 },
        NextParagraph = { text = '}', prio = 8 },
      },
    },
  },
}
