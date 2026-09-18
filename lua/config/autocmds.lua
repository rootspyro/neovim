local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text on yank",
    callback = function()
      vim.hl.on_yank()
    end,
  })
end

return M
