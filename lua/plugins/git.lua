return {
  {
    'lewis6991/gitsigns.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']]', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']]', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[[', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[[', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Diffs
          map('n', '<leader>gd', gitsigns.diffthis)
          map('n', '<leader>gw', gitsigns.toggle_word_diff)
          map('n', '<leader>g-', gitsigns.toggle_deleted)
          map('n', '<leader>gp', gitsigns.preview_hunk)

          -- Manage hunks
          map('n', '<leader>gs', gitsigns.stage_hunk)
          map('n', '<leader>gr', gitsigns.reset_hunk)
          map('n', '<leader>gS', gitsigns.stage_buffer)
          map('n', '<leader>gR', gitsigns.reset_buffer)

          -- Add changed files to quick fix list
          map('n', '<leader>gq', function() gitsigns.setqflist('all') end)

          -- Git blame
          map('n', '<leader>gb', function()
            gitsigns.blame_line({ full = true })
          end)
          map('n', '<leader>gB', function()
            gitsigns.blame()
          end)
        end
      }
    end,
  }
}
