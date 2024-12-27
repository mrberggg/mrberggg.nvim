return {
  {
    'epwalsh/obsidian.nvim',
    cond = not vim.g.vscode,
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-treesitter',
      'ibhagwan/fzf-lua',
    },
    config = function(_, opts)
      require('obsidian').setup(opts)
    end,
    keys = {
      { '<leader>fn', '<CMD>ObsidianQuickSwitch<CR>', '[F]ind [N]ote' },
      { '<leader>no', '<CMD>ObsidianOpen<CR>', '[N]ote [O]pen (in Obsidian)' },
      { '<cr>', '<CMD>lua require("obsidian").util.smart_action()<CR>', '[N]ote [T]oggle checkbox' },
    },
    opts = {
      dir = '~/Documents/vaults',
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ui = {
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          ['!'] = { char = '', hl_group = 'ObsidianImportant' },
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = '•', hl_group = 'ObsidianBullet' },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        block_ids = { hl_group = 'ObsidianBlockID' },
        hl_groups = {
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianImportant = { bold = true, fg = '#d73128' },
          ObsidianBullet = { bold = true, fg = '#89ddff' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianBlockID = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },
    },
  },
}
