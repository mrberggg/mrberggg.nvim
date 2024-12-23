return {
  "ibhagwan/fzf-lua",
  opts = {
    oldfiles = {
      -- In Telescope, when I used <leader>fr, it would load old buffers.
      -- fzf lua does the same, but by default buffers visited in the current
      -- session are not included. I use <leader>fr all the time to switch
      -- back to buffers I was just in. If you missed this from Telescope,
      -- give it a try.
      include_current_session = true,
    },
    previewers = {
      builtin = {
        -- fzf-lua is very fast, but it really struggled to preview a couple files
        -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
        -- It turns out it was Treesitter having trouble parsing the files.
        -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
        -- (Yes, I know you shouldn't have 100KB minified files in source control.)
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
    grep = {
      -- One thing I missed from Telescope was the ability to live_grep and the
      -- run a filter on the filenames.
      -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
      -- With this change, I can sort of get the same behaviour in live_grep.
      -- ex: > enable --*/plugins/*
      -- I still find this a bit cumbersome. There's probably a better way of doing this.
      rg_glob = true,            -- enable glob parsing
      glob_flag = "--iglob",     -- case insensitive globs
      glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
    },

  },
  config = function()
    local actions = require "fzf-lua.actions"
    require('fzf-lua').setup({
      actions = {
        -- Below are the default actions, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        files = {
          false, -- do not inherit from defaults
          -- Pickers inheriting these actions:
          --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
          --   tags, btags, args, buffers, tabs, lines, blines
          -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
          -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
          -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
          ["enter"]  = actions.file_edit_or_qf,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["ctrl-q"] = actions.file_sel_to_qf,
          ["alt-Q"]  = actions.file_sel_to_ll,
        },
      },
    })
  end,
  keys = {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files({
          cwd_only = true,
          previewer = true,
        })
      end,
      mode = { 'n' },
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').files({
          cwd_only = true,
          previewer = true,
          stat_file = true,
        })
      end,
      mode = { 'n' },
      desc = '[F]ind [O]ld files',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').git_files({ cmd = "git ls-files --modified" })
      end,
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      mode = { 'n' },
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      mode = { 'n' },
      desc = '[F]ind [B]uffers',
    },
    {
      '<leader>ft',
      function()
        require('fzf-lua').grep()
      end,
      mode = { 'n' },
      desc = '[F]ind [T]ext',
    },
    {
      'gr',
      function()
        require('fzf-lua').lsp_references()
      end,
    },
    {
      "<leader>fk",
      function()
        require('fzf-lua').keymaps()
      end,
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').manpages()
      end,
      mode = { 'n' },
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fs',
      function()
        require('fzf-lua').treesitter()
      end,
      mode = { 'n' },
      desc = '[F]ind [S]ymbol',
    },
    {
      '<leader>fq',
      function()
        require('fzf-lua').quickfix()
      end,
      mode = { 'n' },
      desc = '[F]ind [S]ymbol',
    },
  }
  ,
}
