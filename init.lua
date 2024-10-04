vim.g.mapleader = ' ';
vim.opt.number = true
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.mouse = "a"  -- Mouse scrolling
vim.opt.termguicolors = true
-- vim.opt.relativenumber = true  -- Can't figure out if this is a good idea or not
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

-- ====== General remaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

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
Plug('lewis6991/gitsigns.nvim');
Plug('nvim-tree/nvim-web-devicons');
Plug('nvim-lualine/lualine.nvim');
Plug('ThePrimeagen/harpoon', { ['branch'] = 'harpoon2'});
Plug('akinsho/bufferline.nvim');

vim.call('plug#end')

-- ====== Theme
require('onedark').load();

-- ====== bufferline
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

-- ====== GitSigns
require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
    on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

	local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
	map('n', '<leader>gb', gitsigns.blame_line)
	map('n', '<leader>gv', gitsigns.blame)
	map('n', '<leader>gp', gitsigns.preview_hunk)
	map('n', '<leader>gr', gitsigns.reset_hunk)

  end
}

-- ====== Status Bar
local function diff_source()
  if vim.fn.exists('*sy#repo#get_stats') == 1 then
    local stats = vim.fn['sy#repo#get_stats']()
    return {
      added = stats[1],
      modified = stats[2],
      removed = stats[3],
    }
  end
end

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
    lualine_b = { {'diff', source = diff_source}, },
    lualine_c = {
    	{
    		'filename',
    		file_status = true,
    		path = 1,
    	}
    },
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

