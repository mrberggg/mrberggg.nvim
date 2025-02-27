return {
  {
    'github/copilot.vim',
    cond = not vim.g.vscode,
    lazy = true,
    event = {
      'InsertEnter',
    },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      { 'github/copilot.vim' },                       -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',                          -- Only on MacOS or Linux
    opts = {},
    keys = {
      { '<leader>aa', '<CMD>CopilotChatToggle<CR>',  desc = 'Toggle AI Chat', },
      { '<leader>ap', '<CMD>CopilotChatPrompts<CR>', desc = 'Choose AI Prompts', },
      { '<leader>am', '<CMD>CopilotChatModels<CR>',  desc = 'Choose AI models', },
    },
  },
}
