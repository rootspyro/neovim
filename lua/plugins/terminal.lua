return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		},
		opts = {
			open_mapping = false,
			direction = "horizontal",
			size = 10,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
		},
	},
}
