local builtin = require('telescope.builtin');
local egrep_actions = require "telescope._extensions.egrepify.actions"
require("telescope").setup {
  extensions = {
    egrepify = {
      -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
      -- if str1 and str2 are consecutively in line with anything in between (wildcard)
      AND = true,                     -- default
      permutations = false,           -- opt-in to imply AND & match all permutations of prompt tokens
      lnum = true,                    -- default, not required
      lnum_hl = "EgrepifyLnum",       -- default, not required, links to `Constant`
      col = false,                    -- default, not required
      col_hl = "EgrepifyCol",         -- default, not required, links to `Constant`
      title = true,                   -- default, not required, show filename as title rather than inline
      filename_hl = "EgrepifyFile",   -- default, not required, links to `Title`
      results_ts_hl = true,           -- set to false if you experience latency issues!
      -- suffix = long line, see screenshot
      -- EXAMPLE ON HOW TO ADD PREFIX!
      prefixes = {
        -- ADDED ! to invert matches
        -- example prompt: ! sorter
        -- matches all lines that do not comprise sorter
        -- rg --invert-match -- sorter
        ["!"] = {
          flag = "invert-match",
        },
        -- HOW TO OPT OUT OF PREFIX
        -- ^ is not a default prefix and safe example
        ["^"] = false
      },
      -- default mappings
      mappings = {
        i = {
          -- toggle prefixes, prefixes is default
          ["<C-z>"] = egrep_actions.toggle_prefixes,
          -- toggle AND, AND is default, AND matches tokens and any chars in between
          ["<C-a>"] = egrep_actions.toggle_and,
          -- toggle permutations, permutations of tokens is opt-in
          ["<C-r>"] = egrep_actions.toggle_permutations,
        },
      },
    },
  },
}
require('telescope').load_extension "egrepify"
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fp', builtin.git_files, {})  -- doesn't seem to work as expected in mrimpossible
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', '<Cmd>Telescope egrepify<CR>', {})

