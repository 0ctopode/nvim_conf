
local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
		save_on_ui_close = true,
	}
})

vim.keymap.set('n', '<leader>w', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

