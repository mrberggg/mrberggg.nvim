return {
  {
    'neovim/nvim-lspconfig',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    opts = {
      servers = {
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
      },
    },
    config = function(_, opts)
      local ensure_installed = vim.tbl_keys(opts.servers or {})

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        automatic_installation = true,
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }

        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
  {
    'yioneko/nvim-vtsls',
    cond = not vim.g.vscode,
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    lazy = false,
    opts = {
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = 'literals' },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
          tsserver = {
            experimental = {
              enableProjectDiagnostics = true,
            },
          },
        },
      },
    },
    config = function()
      local vtsls_config = require('vtsls').lspconfig
      vim.lsp.config('vtsls', vtsls_config)
    end,
    keys = {
      { '<leader>sr', '<Cmd>VtsExec remove_unused_imports<CR>', desc = 'TypeScript remove unused imports' },
      { '<leader>si', '<Cmd>VtsExec add_missing_imports<CR>',   desc = 'TypeScript add missing imports' },
      { '<leader>se', '<Cmd>VtsExec restart_tsserver<CR>',      desc = 'Restart typescript server' },
    },
  },
}
