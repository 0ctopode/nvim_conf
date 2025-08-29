return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		notifier = {
			-- your notifier configuration comes here
			-- or leave it empty to use the default settings
			timeout = 5000, -- default timeout in ms
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
			preset = {
			header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⢻⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢠⣼⣿⣿⣿⡟⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⣿⣿⢃⢃⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⣿⣿⣿⣿⠜⢀⠂⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⡋⠀⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣿⣿⣿⣿⠃⡀⠂⠌⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣷⣬⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⠏⠠⠀⠅⠂⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠟⡛⢁⠂⡑⠈⡄⢉⠐⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⡟⠛⢿⣿⣿⣿⣿⣦⡙⢻⣿⣿⣿⣿⠿⠟⠋⠀⠁⡐⢀⠂⠀⠁⠐⢀⠂⡐⠈⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⡄⠀⠈⠛⠿⣿⣿⣿⠧⠈⠋⠉⠄⡀⢂⠡⢈⠐⡀⢂⠘⠀⣠⣴⣶⣶⣦⣅⠂⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⡄⠀⠀⠀⠀⡉⠁⠀⠆⡈⠐⡈⠄⢀⠂⡐⢂⠐⡀⢂⣾⣿⣿⣿⣿⣿⣿⡁⠒⠚⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣟⡠⠀⠀⠐⣀⠀⠀⡐⠀⠁⠠⠈⠄⢂⠐⡨⠀⠁⣾⣿⣿⣿⣿⣿⣿⠿⠁⡐⢈⣤⡛⣿⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⣿⡁⠀⠀⠉⠂⠀⠐⠂⠡⠈⠀⠡⠈⠄⠂⠄⡁⠀⡿⣿⣿⣿⣿⡿⠟⢀⠂⠔⣯⣾⣽⡼⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⡿⢃⢤⣦⣶⣶⣀⡠⡀⠀⠑⠀⠀⠡⠈⠄⠡⣀⠡⣛⡦⠉⡀⢀⠀⠄⢂⠘⡈⠙⣉⣼⣟⣿⣿⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⠃⠠⢸⣿⣿⣿⣿⣿⣦⠄⠀⠀⠀⠀⠈⠄⠡⠀⠼⣿⣷⢇⠐⠠⠌⡐⢈⠐⣠⡑⢉⠦⣙⣮⣽⣿⣿⣿⣿⣿
   ⣿⣿⣿⣿⡷⠀⢹⣿⣿⣿⣿⠿⠙⠀⠄⠠⠀⠀⠀⠀⠄⡁⢂⡽⣡⡆⢈⠐⠠⢐⡈⠐⡠⠴⠿⣟⡿⣿⣞⠽⢻⣿⣿⣿
   ⣿⣿⣿⣿⡇⡀⠨⠍⠉⠉⠡⠂⠀⠌⠠⠁⠄⠀⡈⠔⣨⢴⣾⣿⣿⠛⠀⠈⢂⠡⢁⡶⠴⠃⣉⣡⣽⠷⣖⢊⠱⣿⣿⣿
   ⣿⣿⣿⣿⡇⠠⠐⡀⠂⠄⡀⠀⠠⠈⠀⠁⣀⠀⣐⡈⢷⠛⣿⣿⠟⠀⡀⠌⠒⠋⣩⣴⣦⠿⠷⣿⢿⡿⣯⢏⠶⣹⣿⣿
   ⣿⣿⣿⣿⣧⠀⡡⢀⠁⢂⠐⠀⠀⠀⠀⠀⠀⠈⠣⢐⠠⢹⡄⠏⡀⢂⡐⢈⠰⣉⣻⣽⣷⣿⣿⣿⣾⣶⣧⠎⡔⢤⣻⣿
   ⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡄⡄⢡⠐⠀⢣⡜⢳⣿⣾⣿⡝⣾⣿⣽⡎⢱⠊⣧⣿⣿
   ⣿⣿⣿⣿⣿⣟⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠐⣿⣿⣶⣶⣾⣷⣶⣷⣿⣿⡟⣎⢷⣻⣟⡷⢭⡣⢏⡴⢍⠿
   ⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⠛⡛⠍⠻⠿⡿⢿⠿⣿⡻⢧⡙⡜⣾⣹⠾⣏⢇⠛⡖⢠⠈⡀
   ⣿⣿⡿⣿⡿⣛⣭⣷⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢂⠐⠠⠈⠄⡑⠈⠄⡙⠴⣉⢦⠱⣍⠶⣭⢻⠆⣎⠳⠈⠄⠂⠄
   ⣿⣿⣿⣿⣾⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠁⠂⠄⡁⢂⠐⠌⡒⢎⠳⣌⠛⡴⣟⡬⣄⠂⠡⠈⠠⠀
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠠⠐⠠⢈⠐⡈⠄⡁⠦⢙⡘⠡⠈⠄⠈⠄⠐⠀⠀
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠄⢂⠐⠠⠐⡐⠠⢁⠂⡁⠠⠀⠠⠀⠀⠂
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠈⠄⠡⡈⠄⠌⡐⢁⠂⡁⢂⠐⡀⠂⠄⡁⠠⠁⠄
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠐⠠⠀⠄⡀⢀⠀⡐⢈⠐⡈⠄⢂⠡⠌⡐⠘⡀⠂⠔⡈⠐⡀⢂⠐⠠⢁⠂⠄⡁⠐⡀
]],
			}
			--  sections = {
			--    {
			--	section = "terminal",
			--	cmd = "chafa /home/harvey/Pictures/doG/flat.png --format symbols --symbols vhalf --size 60x17; sleep .1",
			--	height = 17,
			--	padding = 1,
			--    },
			--    {
			--	pane = 2,
			--	{ section = "keys", gap = 1, padding = 1 },
			--	{ section = "startup" },
			--    },
			--  },
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { layout = { position = "right" } },
				}
			}
		},

		explorer = {
			enabled = true,
			replace_netrw = true,
		},
	},

	keys = {
		-- { "<leader>df", function() Snacks.picker.files() end, desc = "Find Files" },
		-- { "<leader>db", function() Snacks.picker.buffers() end, desc = "Buffers", },
		-- { "<leader>dg", function() Snacks.picker.grep() end, desc = "Grep" },

		{ "<leader>tr", function() Snacks.explorer() end },
	}
}

