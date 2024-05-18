return {
  {
    "ahmedkhalf/project.nvim",
    cond = not vim.g.vscode,
    lazy = true,
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "package.json" },
        exclude_dirs = { "node_modules" }
      })
    end
  },
}
