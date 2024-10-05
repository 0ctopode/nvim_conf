
local builtin = require('telescope.builtin');
require('telescope').setup();
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fp', builtin.git_files, {})  -- doesn't seem to work as expected in mrimpossible
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

