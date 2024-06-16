return {
  'nvim-telescope/telescope.nvim',
  cond = not vim.g.vscode,
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      pickers = {
        help_tags = {
          mappings = {
            n = {
              ['<CR>'] = 'file_vsplit',
            },
            i = {
              ['<CR>'] = 'file_vsplit',
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        initial_mode = 'normal',
        theme = 'center',
        sorting_strategy = 'ascending',
        prompt_prefix = '󰼛 ',
        selection_caret = '󱞩 ',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.3,
          },
        },
        path_display = {
          'smart',
        },
      },
    }

    telescope.load_extension 'projects'
  end,
  keys = {
    {
      '<leader>fw',
      function()
        require('telescope.builtin').live_grep {
          initial_mode = 'insert',
          glob_pattern = { '*.tsx', '!*.test.tsx' },
        }
      end,
      mode = { 'n' },
      desc = '[F]ind [W]ord (.tsx)',
    },
    {
      '<leader>fa',
      function()
        require('telescope.builtin').live_grep { initial_mode = 'insert' }
      end,
      mode = { 'n' },
      desc = '[F]ind [A]ll words',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files { initial_mode = 'insert', file_ignore_patterns = { '__tests__', '.test.ts*' } }
      end,
      mode = { 'n' },
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>ft',
      function()
        require('telescope.builtin').find_files { initial_mode = 'insert', file_ignore_patterns = { 'not .test.ts*' } }
      end,
      mode = { 'n' },
      desc = '[F]ind [T]est files',
    },
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').buffers()
      end,
      mode = { 'n' },
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>fo',
      function()
        require('telescope.builtin').oldfiles()
      end,
      mode = { 'n' },
      desc = '[F]ind [O]ld Files',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').resume()
      end,
      mode = { 'n' },
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>fp',
      function()
        require('telescope').extensions.projects.projects {}
      end,
      mode = { 'n' },
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>fs',
      function()
        require('telescope.builtin').treesitter { initial_mode = 'insert' }
      end,
      mode = { 'n' },
      desc = '[F]ind [S]ymbol',
    },
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags { initial_mode = 'insert' }
      end,
      mode = { 'n' },
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('telescope.builtin').keymaps { initial_mode = 'insert' }
      end,
      mode = { 'n' },
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fc',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      mode = { 'n' },
      desc = '[F]ind [C]onfig files',
    },
    {
      -- TODO
      '<leader>gco',
      function()
        require('telescope.builtin').git_branches()
      end,
      mode = { 'n' },
      desc = '[G]it [C]heck[o]ut Branch',
    },
    {
      -- TODO
      '<leader>gst',
      function()
        require('telescope.builtin').git_status()
      end,
      mode = { 'n' },
      desc = '[G]it [St]atus',
    },
  },
}
