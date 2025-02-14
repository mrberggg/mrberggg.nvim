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
        pyright = {},
        volar = {},
      },
    },
    config = function(_, opts)
      local ensure_installed = vim.tbl_keys(opts.servers or {})

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        automatic_installation = true,
      }

      local lspconfig = require 'lspconfig'

      -- LSP servers and clients are able to communicate to each other what features they support.
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }

        lspconfig[server].setup(config)
      end

      --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- Create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('<leader>.', ':lua vim.lsp.buf.code_action()<CR>', '[C]ode [A]ction')
          map('K', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
              vim.lsp.buf.hover()
            end
          end, 'Hover info')

          -- Highlight references of the word under your cursor when your cursor rests there for a little while.
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
      require('lspconfig.configs').vtsls = require('vtsls')
          .lspconfig -- set default server config, optional but recommended
    end,
    keys = {
      { '<leader>tr', '<Cmd>VtsExec remove_unused_imports<CR>', desc = '[T]ypeScript [R]emove unused imports' },
      { '<leader>ti', '<Cmd>VtsExec add_missing_imports<CR>',   desc = '[T]ypeScript [A]dd missing imports' },
      { '<leader>tf', '<Cmd>VtsExec fix_all<CR>',               desc = '[T]ypeScript fix [a]ll' },
      { '<leader>re', '<Cmd>VtsExec restart_tsserver<CR>',      desc = '[TypeScript] [R]estart' },
    },
  },
}
