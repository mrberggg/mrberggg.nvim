return {
  {
    "github/copilot.vim",
    cond = not vim.g.vscode,
    lazy = true,
    event = {
      "InsertEnter",
    },
  },

}
