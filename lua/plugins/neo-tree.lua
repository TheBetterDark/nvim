return {
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
	end
}
