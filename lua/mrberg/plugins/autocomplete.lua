return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    cond = not vim.g.vscode,
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      -- Add LSP capabilities
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function(_, opts)
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        -- completion = { completeopt = 'menu,menuone,noinsert' },
        completion = cmp.config.window.bordered(),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-j>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-k>'] = cmp.mapping.select_prev_item(),

          -- Accept the completion.
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          -- group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          { name = 'lazydev', group_index = 0 },
        },
        {
          { name = 'buffer' }
        },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    cond = not vim.g.vscode,
    event = "InsertEnter",
    config = true
  },
  {
    "windwp/nvim-ts-autotag",
    cond = not vim.g.vscode,
    lazy = true,
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    cond = not vim.g.vscode,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    -- follow latest release.
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()


      vim.keymap.set({ "i" }, "<C-s>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end
  }
}
