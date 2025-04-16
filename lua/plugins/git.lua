return {
  {
    'lewis6991/gitsigns.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
      }
    end,
    keys = {
      -- Nav
      {
        ']]',
        function()
          if vim.wo.diff then
            vim.cmd.normal({ ']]', bang = true })
          else
            require('gitsigns').nav_hunk('next')
          end
        end,
        desc = 'Git next hunk'
      },
      {
        '[[',
        function()
          if vim.wo.diff then
            vim.cmd.normal({ '[[', bang = true })
          else
            require('gitsigns').nav_hunk('prev')
          end
        end,
        desc = 'Git next hunk'
      },
      -- Diffs
      { '<leader>gd', "<CMD>lua require('gitsigns').diffthis()<CR>",                  desc = 'Git diff this' },
      { '<leader>gw', '<CMD>Gitsigns toggle_word_diff<CR>',                           desc = 'Git toggle word diff' },
      { '<leader>g-', '<CMD>Gitsigns toggle_deleted<CR>',                             desc = 'Git toggle deleted' },
      { '<leader>gp', '<CMD>Gitsigns preview_hunk<CR>',                               desc = 'Git preview hunk' },
      -- Manage hunks
      { '<leader>gs', '<CMD>Gitsigns stage_hunk<CR>',                                 desc = 'Git stage hunk' },
      { '<leader>gr', '<CMD>Gitsigns reset_hunk<CR>',                                 desc = 'Git reset hunk' },
      { '<leader>gS', '<CMD>Gitsigns stage_buffer<CR>',                               desc = 'Git stage buffer' },
      { '<leader>gR', '<CMD>Gitsigns reset_buffer<CR>',                               desc = 'Git reset buffer' },
      -- Add changed files to quick fix list
      { '<leader>gq', function() require('gitsigns').setqflist('all') end,            desc = 'Add all modified files to QF list' },
      -- Git blame
      { '<leader>gb', function() require('gitsigns').blame_line({ full = true }) end, desc = 'Git blame line' },
      { '<leader>gB', function() require('gitsigns').blame() end,                     desc = 'Git blame buffer' },
    }
  },
}
