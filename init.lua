vim.g.mapleader = ' ';
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling
vim.opt.termguicolors = true
vim.opt.relativenumber = true  -- Can't figure out if this is a good idea or not

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
--		eol = '↵',
		tab = '⇥ ',
		space = '◦'
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
Plug('preservim/nerdtree');
Plug('Xuyuanp/nerdtree-git-plugin');
Plug('nvim-lua/plenary.nvim');  -- Dependency for telescope
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate'});
Plug('NeogitOrg/neogit');
Plug('sindrets/diffview.nvim');  -- Used by neogit
Plug('airblade/vim-gitgutter');
Plug('nvim-tree/nvim-web-devicons');
Plug('nvim-lualine/lualine.nvim');
Plug('ThePrimeagen/harpoon', { ['branch'] = 'harpoon2'});
Plug('akinsho/bufferline.nvim');

vim.call('plug#end')

-- ====== Theme
require('onedark').load();

-- ====== bufferline
require("bufferline").setup{}

-- ====== Neogit
local neogit = require('neogit');
neogit.setup {}

-- ====== Harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<C-w>', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- ====== Status Bar
-- require('statusbar_config');
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'selectioncount', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- ====== Telescope
local builtin = require('telescope.builtin');
require('telescope').setup();
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fp', builtin.git_files, {})  -- doesn't seem to work as expected in mrimpossible
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ====== COC
require('coc_cfg')

-- ====== Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "sql", "javascript", "typescript", "css", "html" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- ====== devicons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = "",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
 };
}

