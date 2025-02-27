return {
  {
    'nvim-neotest/neotest',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- Runners
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-python',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
          },
          require 'neotest-vitest' {
            -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
            filter_dir = function(name, rel_path, root)
              return name ~= 'node_modules'
            end,
          },
        },
      }
    end,
    keys = {
      {
        '<leader>tt',
        '<Cmd>w<CR><Cmd>lua require("neotest").run.run()<CR>',
        desc = '[R]un test',
      },
      {
        '<leader>td',
        '<Cmd>require("neotest").run.run({strategy = "dap"})<CR>',
        desc = 'Debug test',
      },
      {
        '<leader>ta',
        '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
        desc = 'Test all in file',
      },
    },
  }
}
