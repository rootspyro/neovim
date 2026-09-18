return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "lua",
        "go",
        "gomod",
        "gowork",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "vim",
        "vimdoc",
        "query",
        "regex",
      })
    end,
  },
}
