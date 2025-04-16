
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
vim.opt.expandtab = false
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.softtabstop = 0
vim.opt.smarttab = true
-- Set indentation *after* ftplugins
vim.api.nvim_command([[au FileType * setl expandtab< shiftwidth< softtabstop< tabstop<]])  -- This is so cooked

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


vim.keymap.set('n', '<leader>qq', '<Cmd>CodeCompanionActions<CR>', {})

