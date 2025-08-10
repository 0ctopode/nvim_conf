-- Woooo emojis 🎉
return {
	"ziontee113/icon-picker.nvim",
	keys = {
		{ "<leader>fe", '<Cmd>IconPickerNormal<CR>', desc = "icon-picker"}
	},
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<Leader>fe", "<cmd>IconPickerNormal<cr>", opts)
	end
}