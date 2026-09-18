return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {
          ui = { border = "rounded" },
        },
      },
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "basedpyright",
        "ts_ls",
        "html",
        "cssls",
      },
    },
    config = function(_, opts)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },
}
