return {
	"OXY2DEV/markview.nvim",
	enabled = false,
	-- branch = "dev",
	-- lazy = false,      -- Recommended
	-- You can't tell me what to do
	ft = "markdown", -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},

	opts = {
		code_blocks = {
			-- Code blocks look cooked with word wrap
			style = "simple",
			-- language_names = { Unknown = "Plaintext" },
			sign = false,
		},
		markdown = {
			list_items = {
				shift_width = 2,
			},
		}
	},
}
