return {
  {
    'stevearc/conform.nvim',
    cond = not vim.g.vscode,
    lazy = false,
    config = function()
      require('conform').setup {
        notify_on_error = true,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black' },
          javascript = { 'eslint_d' },
          typescript = { 'eslint_d' },
          javascriptreact = { 'eslint_d' },
          typescriptreact = { 'eslint_d' },
        },
      }
    end,
  },
}
