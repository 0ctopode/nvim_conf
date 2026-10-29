return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_ui_close = true,
			}
		})

		vim.keymap.set('n', '<leader>w', function() harpoon:list():add() end)
		vim.keymap.set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		-- Jump to specific list items
		vim.keymap.set("n", "<M-q>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<M-w>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<M-e>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<M-r>", function() harpoon:list():select(4) end)
		vim.keymap.set("n", "<M-t>", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<M-y>", function() harpoon:list():select(6) end)
		vim.keymap.set("n", "<M-u>", function() harpoon:list():select(7) end)
		vim.keymap.set("n", "<M-i>", function() harpoon:list():select(8) end)
	end

}
