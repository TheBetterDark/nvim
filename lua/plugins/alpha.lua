return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button( 'e', "  New file" , ":ene <BAR>startinsert<CR>"),
			dashboard.button( "Spc f f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button( "Spc f o", "󰈚  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button( "Spc m a", "  Bookmarks", ":Telescope marks<CR>"),
		}
		alpha.setup(dashboard.opts)

		vim.keymap.set('n', "<ESC>", ":Alpha<CR>", {})
	end,
}
