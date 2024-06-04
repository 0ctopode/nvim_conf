vim.g.mapleader = ' ';
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling

-- Tabs
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.copyindent = true
vim.opt.preserveindent = true;
vim.opt.softtabstop = 0;
vim.opt.smarttab = true;

-- Whitespace
vim.opt.list = true;
vim.opt.listchars = {
--      eol = '↵',
        tab = '⇥ ',
--      space = '◦'
};

vim.opt.encoding = "utf-8";
vim.opt.compatible = false  -- Prevents vim tryna be backwards compatible with vi or something
vim.opt.backspace = {'indent', 'eol', 'start'}  -- Allow backspacing over everything in insert mode

-- ====== Vim Plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('navarasu/onedark.nvim');
Plug('neoclide/coc.nvim', { ['branch'] = 'release' });
-- Plug('preservim/nerdtree');
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('nvim-lua/plenary.nvim');  -- Dependency for telescope
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate'})
Plug('NeogitOrg/neogit');
Plug('airblade/vim-gitgutter');

vim.call('plug#end')

-- ====== Theme
require('onedark').load();

local neogit = require('neogit');
neogit.setup {}

-- ====== Telescope
local builtin = require('telescope.builtin');
require('telescope').setup();
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ====== COC
require('coc_cfg')

