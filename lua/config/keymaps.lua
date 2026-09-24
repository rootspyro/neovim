local M = {}

M.setup = function()
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

  vim.keymap.set("n", "<leader>n", "<cmd>Explore<cr>", { desc = "File explorer (netrw)" })

  vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>", { desc = "Vertical split" })
  vim.keymap.set("n", "<leader>vh", "<cmd>split<CR>", { desc = "Horizontal split" })
  vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete buffer and close window" })

  vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
  vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
  vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
  vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })

  vim.keymap.set("n", "<leader>lc", "gcc", { remap = true, desc = "Comment line" })
  vim.keymap.set("v", "<leader>vc", "gc", { remap = true, desc = "Comment selection" })
end

return M
