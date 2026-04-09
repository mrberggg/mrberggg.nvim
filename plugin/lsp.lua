if vim.g.vscode then return end

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/yioneko/nvim-vtsls',
}

-- Mason
require('mason').setup {}

-- LSP servers
local servers = {
  vtsls = {},
  eslint = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  cssls = {},
  html = {},
  jsonls = {},
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
  markdown_oxide = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
    before_init = function(_, config)
      local Path = require('plenary.path')
      local venv = vim.fn.trim(vim.fn.system('poetry env info --path 2>/dev/null'))
      if venv and venv ~= '' and vim.v.shell_error == 0 then
        config.settings.python.pythonPath = Path:new(venv, 'bin', 'python'):absolute()
      end
    end,
  },
}

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
}

for server, config in pairs(servers) do
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  config.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

-- nvim-vtsls
local vtsls_config = require('vtsls').lspconfig
vim.lsp.config('vtsls', vtsls_config)

-- vtsls keymaps
vim.keymap.set('n', '<leader>sr', '<Cmd>VtsExec remove_unused_imports<CR>', { desc = 'TypeScript remove unused imports' })
vim.keymap.set('n', '<leader>si', '<Cmd>VtsExec add_missing_imports<CR>', { desc = 'TypeScript add missing imports' })
vim.keymap.set('n', '<leader>se', '<Cmd>VtsExec restart_tsserver<CR>', { desc = 'Restart typescript server' })
