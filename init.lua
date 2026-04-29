
-- INIT.LUA

vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.g.editorconfig = false  -- wow this was annoying in a git repo
vim.opt.linebreak = true

-- Case insensitive when searching all lowercase but case sensitive if any uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- overrides ignorecase if capitals present

-- Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true

local indent_augroup = vim.api.nvim_create_augroup("IndentSettings", { clear = true })

-- Default indentation (tabs)
-- Need this as the base case becuase ftplugins is annoying
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	group = indent_augroup,
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 6
		vim.opt_local.shiftwidth = 6
		vim.opt_local.softtabstop = 6
	end,
})

-- Use spaces for dart files
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"dart", "yaml"},
	group = indent_augroup,
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Whitespace
vim.opt.list = true;
vim.opt.listchars = {
--	eol = '↵',
	tab = '⇥ ',
	space = '◦'
};

vim.opt.encoding = "utf-8";
vim.opt.compatible = false  -- Prevents vim tryna be backwards compatible with vi or something
vim.opt.backspace = {'indent', 'eol', 'start'}  -- Allow backspacing over everything in insert mode


-- General Remaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"t"}, "<Esc>", "<C-\\><C-N>")

-- Setting up Lazy
require("config.lazy")

-- Theme
-- require('onedark').load();
vim.cmd[[colorscheme tokyonight-night]]

