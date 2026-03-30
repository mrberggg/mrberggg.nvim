if vim.g.vscode then return end

vim.pack.add {
  'https://github.com/github/copilot.vim',
  'https://github.com/folke/sidekick.nvim',
}

require('sidekick').setup {
  cli = {
    mux = {
      backend = 'zellij',
      enabled = true,
    },
  },
}

vim.keymap.set('n', '<tab>', function()
  if not require('sidekick').nes_jump_or_apply() then
    return '<Tab>'
  end
end, { expr = true, desc = 'Goto/Apply Next Edit Suggestion' })

vim.keymap.set({ 'n', 'x' }, '<leader>aa', function() require('sidekick.cli').prompt() end,
  { desc = 'Sidekick Select Prompt' })
vim.keymap.set('n', '<leader>as', function() require('sidekick.cli').toggle({ focus = true }) end,
  { desc = 'Sidekick Toggle CLI' })
vim.keymap.set({ 'n', 'x', 'i', 't' }, '<c-.>', function() require('sidekick.cli').focus() end,
  { desc = 'Sidekick Switch Focus' })
vim.keymap.set('n', '<c-,>', function() require('sidekick.cli').toggle({ name = 'claude', focus = true }) end,
  { desc = 'Sidekick Toggle Claude' })
