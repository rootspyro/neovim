local M = {}

M.setup = function()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.mouse = "a"
	vim.opt.clipboard = "unnamedplus"
	vim.opt.breakindent = true
	vim.opt.undofile = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.signcolumn = "yes"
	vim.opt.updatetime = 250
	vim.opt.timeoutlen = 300
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.termguicolors = true
	vim.opt.scrolloff = 8
	vim.opt.sidescrolloff = 8
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.smartindent = true
	vim.opt.wrap = false

	vim.g.netrw_liststyle = 3
	vim.g.netrw_winsize = 25
	vim.g.netrw_keepdir = 0
end

return M
