return {
  {
    'tanvirtin/vgit.nvim',
    branch = 'v1.0.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    -- Lazy loading on 'VimEnter' event is necessary.
    event = 'VimEnter',
    config = function()
      require("vgit").setup()
    end,
    keys = {
      { ']g',          '<CMD>VGit hunk_down<CR>',                       desc = 'Previous hunk' },
      { '[g',          '<CMD>VGit hunk_up<CR>',                         desc = 'Next hunk' },
      { '<leader>gp',  '<CMD>VGit buffer_hunk_preview<CR>',             desc = 'Git diff hunk' },
      { '<leader>gS',  '<CMD>VGit buffer_hunk_stage<CR>',               desc = 'Git stage hunk' },
      { '<leader>g!',  '<CMD>VGit buffer_hunk_reset<CR>',               desc = 'Git discard hunk' },
      { '<leader>gcb', '<CMD>VGit buffer_conflict_accept_both<CR>',     desc = 'Git conflict accept both' },
      { '<leader>gcc', '<CMD>VGit buffer_conflict_accept_current<CR>',  desc = 'Git conflict accept current' },
      { '<leader>gci', '<CMD>VGit buffer_conflict_accept_incoming<CR>', desc = 'Git conflict accept incoming' },
      { '<leader>gd',  '<CMD>VGit project_diff_preview<CR>',            desc = 'Git conflict accept incoming' },
    }
  }
}
