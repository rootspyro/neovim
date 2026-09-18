local M = {}

M.setup = function()
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

  vim.keymap.set("n", "<leader>n", "<cmd>Explore<cr>", { desc = "File explorer (netrw)" })
end

return M
