-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically format the buffer before saving, excluding TS and JS files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local filetype = vim.bo.filetype
    if filetype ~= "typescriptreact" and filetype ~= "javascriptreact" and filetype ~= "typescript" and filetype ~= "javascript" then
      local client = vim.lsp.get_clients({ bufnr = 0 })[1]
      -- Format if LSP exists
      if client and client.supports_method("textDocument/formatting") then
        print(filetype)
        vim.lsp.buf.format()
      end
    end
  end
})

-- Automatically run ESLint on save for JavaScript and TypeScript files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  command = "EslintFixAll",
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { "*.lua", "*.py", "*.json", "*.md", "*.html", "*.css", "*.scss", "*.yaml", "*.yml" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- No unneeded borders around vim https://github.com/neovim/neovim/issues/16572#issuecomment-1954420136
local modified = false
vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    if normal.bg then
      io.write(string.format('\027]11;#%06x\027\\', normal.bg))
      modified = true
    end
  end,
})

-- Remove hack for unused borders
vim.api.nvim_create_autocmd('UILeave', {
  callback = function()
    if modified then
      io.write '\027]111\027\\'
    end
  end,
})


-- Highlight references of the word under your cursor when your cursor rests there for a little while.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
