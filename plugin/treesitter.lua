if vim.g.vscode then return end

vim.pack.add {
  'https://github.com/reybits/ts-forge.nvim',
}

-- Neovim 0.12 bundles parsers for: c, lua, markdown, markdown_inline, query, vim, vimdoc
-- ts-forge installs additional parsers async on startup.
require('ts-forge').setup {
  auto_install = true,
  ensure_installed = {
    'typescript', 'tsx', 'javascript', 'json',
    'html', 'css', 'bash', 'yaml', 'python',
  },
}

vim.treesitter.language.register('tsx', { 'typescriptreact' })
vim.treesitter.language.register('json', { 'jsonc' })

-- Use Vim's built-in syntax highlighting; treesitter is used only for
-- indent, folds, and incremental selection (parser attaches lazily).
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    if pcall(vim.treesitter.get_parser, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'vim.treesitter'.indentexpr()"
    end
  end,
})

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
