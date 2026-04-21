if vim.g.vscode then return end
if vim.env.ZELLIJ == nil then return end

-- Seamless nav between nvim splits and zellij panes.
-- Ctrl-hjkl moves within nvim if possible; otherwise hands focus to the
-- adjacent zellij pane. Requires matching Ctrl-hjkl → MoveFocus bindings
-- in zellij config.kdl (and zellij-autolock to pass Ctrl-h through to nvim
-- when nvim has focus).
local function nav(wincmd_dir, zellij_dir)
  local before = vim.api.nvim_get_current_win()
  vim.cmd.wincmd(wincmd_dir)
  if before == vim.api.nvim_get_current_win() then
    vim.system({ 'zellij', 'action', 'move-focus', zellij_dir }, { detach = true })
  end
end

vim.keymap.set('n', '<C-h>', function() nav('h', 'left')  end, { silent = true, desc = 'Navigate left (nvim/zellij)' })
vim.keymap.set('n', '<C-j>', function() nav('j', 'down')  end, { silent = true, desc = 'Navigate down (nvim/zellij)' })
vim.keymap.set('n', '<C-k>', function() nav('k', 'up')    end, { silent = true, desc = 'Navigate up (nvim/zellij)' })
vim.keymap.set('n', '<C-l>', function() nav('l', 'right') end, { silent = true, desc = 'Navigate right (nvim/zellij)' })
