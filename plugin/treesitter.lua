if vim.g.vscode then return end

vim.pack.add {
  'https://github.com/arborist-ts/arborist.nvim',
}

require('arborist').setup {
  ensure_installed = {
    'typescript', 'tsx', 'javascript', 'json',
    'html', 'css', 'bash', 'yaml', 'python',
  },
}

vim.treesitter.language.register('tsx', { 'typescriptreact' })
vim.treesitter.language.register('json', { 'jsonc' })

-- Incremental selection via treesitter nodes
local sel_node = nil

vim.keymap.set('n', '-', function()
  sel_node = vim.treesitter.get_node()
  if not sel_node then return end
  local sr, sc, er, ec = sel_node:range()
  vim.fn.setpos("'<", { 0, sr + 1, sc + 1, 0 })
  vim.fn.setpos("'>", { 0, er + 1, ec, 0 })
  vim.cmd('normal! gv')
end, { desc = 'Init treesitter selection' })

vim.keymap.set('v', '-', function()
  if sel_node and sel_node:parent() then
    sel_node = sel_node:parent()
    local sr, sc, er, ec = sel_node:range()
    vim.fn.setpos("'<", { 0, sr + 1, sc + 1, 0 })
    vim.fn.setpos("'>", { 0, er + 1, ec, 0 })
    vim.cmd('normal! gv')
  end
end, { desc = 'Expand treesitter selection' })

vim.keymap.set('v', '_', function()
  if sel_node then
    local child = sel_node:named_child(0)
    if child then
      sel_node = child
    end
    local sr, sc, er, ec = sel_node:range()
    vim.fn.setpos("'<", { 0, sr + 1, sc + 1, 0 })
    vim.fn.setpos("'>", { 0, er + 1, ec, 0 })
    vim.cmd('normal! gv')
  end
end, { desc = 'Shrink treesitter selection' })
