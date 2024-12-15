
-- INIT.LUA

vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling
vim.opt.termguicolors = true
vim.opt.relativenumber = true  -- Can't figure out if this is a good idea or not
vim.g.editorconfig = false  -- wow this was annoying in a git repo

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


-- Setting up Lazy
require("config.lazy")

-- General Plugin keybinds
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit<CR>')

vim.keymap.set('n', '<leader>tt', '<Cmd>Neotree position=float<CR>')
vim.keymap.set('n', '<leader>tr', '<Cmd>Neotree position=right<CR>')
vim.keymap.set('n', '<leader>to', '<Cmd>Oil --float<CR>')


-- Theme
require('onedark').load();

