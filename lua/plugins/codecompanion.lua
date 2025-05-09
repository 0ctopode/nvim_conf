return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>q", '<Cmd>CodeCompanionActions<CR>', desc = "codecompanion"}
	},
	opts = {
		strategies = {
			chat = {
				adapter = "gemini",
			},
			inline = {
				adapter = "gemini",
			},
		},
	},

}
