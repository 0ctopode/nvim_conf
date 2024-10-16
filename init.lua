
-- INIT.LUA

vim.g.mapleader = ' ';
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling
vim.opt.termguicolors = true
vim.opt.relativenumber = true  -- Can't figure out if this is a good idea or not
vim.g.editorconfig = false  -- wow this was annoying in a git repo

-- Tabs
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.copyindent = true
vim.opt.preserveindent = true;
vim.opt.softtabstop = 0;
vim.opt.smarttab = true;
-- Set indentation *after* ftplugins
vim.api.nvim_command([[au FileType * setl expandtab< shiftwidth< softtabstop< tabstop<]])  -- This is so cooked

-- Whitespace
vim.opt.list = true;
vim.opt.listchars = {
--		eol = '↵',
		tab = '⇥ ',
		space = '◦'
};

vim.opt.encoding = "utf-8";
vim.opt.compatible = false  -- Prevents vim tryna be backwards compatible with vi or something
vim.opt.backspace = {'indent', 'eol', 'start'}  -- Allow backspacing over everything in insert mode


-- General Remaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])


-- Vim Plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'MunifTanjim/nui.nvim';  -- Dependency for neotree
Plug('navarasu/onedark.nvim');
Plug('neoclide/coc.nvim', { ['branch'] = 'release' });
Plug('nvim-neo-tree/neo-tree.nvim');
Plug('nvim-lua/plenary.nvim');  -- Dependency for telescope
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate'});
Plug('NeogitOrg/neogit');
Plug('sindrets/diffview.nvim');  -- Used by neogit
Plug('lewis6991/gitsigns.nvim');
Plug('nvim-tree/nvim-web-devicons');
Plug('nvim-lualine/lualine.nvim');
Plug('ThePrimeagen/harpoon', { ['branch'] = 'harpoon2'});
Plug('goolord/alpha-nvim');
Plug('fdschmidt93/telescope-egrepify.nvim')
Plug('stevearc/oil.nvim')

vim.call('plug#end')


-- Plugin Config
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.coc')
require('plugins.devicons')
require('plugins.treesitter')
require('plugins.neotree')
require('plugins.harpoon')

-- General Plugin keybinds
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit<CR>')

vim.keymap.set('n', '<leader>tt', '<Cmd>Neotree position=float<CR>')
vim.keymap.set('n', '<leader>tr', '<Cmd>Neotree position=right<CR>')


-- Theme
require('onedark').load();


-- Simple Configs

-- α Alpha Startup
require'alpha'.setup(require'alpha.themes.theta'.config)

-- Neogit
require('neogit').setup{}

-- Oil
require("oil").setup();

