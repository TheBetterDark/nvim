return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim"
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({})
					}
				}
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', "<leader>fg", builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
			vim.keymap.set('n', '<leader>ma', builtin.marks, {})
			vim.keymap.set('n', '<leader><space>', builtin.keymaps, {})

			require("telescope").load_extension("ui-select")
		end
	}
}
