
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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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
-- Plug('preservim/nerdtree');
-- Plug('Xuyuanp/nerdtree-git-plugin');
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
Plug('akinsho/bufferline.nvim');
Plug('goolord/alpha-nvim');

vim.call('plug#end')


-- Plugin Config
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.coc')
require('plugins.devicons')
require('plugins.treesitter')
require('plugins.neotree')

-- General Plugin keybinds
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit<CR>')

vim.keymap.set('n', '<leader>tt', '<Cmd>Neotree position=float<CR>')
vim.keymap.set('n', '<leader>tr', '<Cmd>Neotree position=right<CR>')


-- Theme
require('onedark').load();

-- α Alpha Startup
require'alpha'.setup(require'alpha.themes.theta'.config)

-- Bufferline
local bufferline = require('bufferline')
require("bufferline").setup{
	options = {
		mode = "tabs",
		separator_style = "slope",
	}
}


-- ====== Neogit
local neogit = require('neogit');
neogit.setup {}


-- ====== Harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<leader>w', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

