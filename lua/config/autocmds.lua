local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text on yank",
    callback = function()
      vim.hl.on_yank()
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Enable Treesitter highlighting",
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end

return M
