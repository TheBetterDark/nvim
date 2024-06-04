return {
	{
		"m4xshen/catppuccinight.nvim",
		name = "catppuccin",
		opts = {
			flavour = "frappe",
			custom_highlights = function(colors)
				return {
					VertSplit = { fg = colors.surface0 },
				}
			end,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set(
				{ "v", "n" },
				"<Leader>ca",
				require("actions-preview").code_actions
			)
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
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
				dashboard.button( "e", "  New file" , ":ene <BAR>startinsert<CR>"),
				dashboard.button( "Spc f f", "  Find File", ":Telescope find_files<CR>"),
				dashboard.button( "Spc f o", "󰈚  Recent Files", ":Telescope oldfiles<CR>"),
				dashboard.button( "Spc m a", "  Bookmarks", ":Telescope marks<CR>"),
			}
			alpha.setup(dashboard.opts)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim"
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["P"] = {
							"toggle_preview",
							config = {
								use_float = false,
								use_image_nvim = true
							}
						},
					}
				},
				event_handlers = {
					{
							event = "file_renamed",
							handler = function(args)
						print(args.source, " renamed to ", args.destination)
						end
						},
						{
							event = "file_moved",
							handler = function(args)
							print(args.source, " moved to ", args.destination)
							end
						},
					{
							event = "neo_tree_buffer_enter",
							handler = function()
								vim.cmd("highlight! Cursor blend=100")
							end,
						},
						{
							event = "neo_tree_buffer_leave",
							handler = function()
								vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
							end,
						}
				}
			})

			vim.keymap.set('n', "<leader>bf", ":Neotree buffers reveal float<CR>", {})
			vim.keymap.set('n', '<TAB>', ":Neotree toggle filesystem right<CR>",{})
		end,
	},
}
