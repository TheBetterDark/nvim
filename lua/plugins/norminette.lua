return {
	{
		"TheBetterDark/nvim-norminette",
		config = function()
			require("nvim-norminette").setup()
		end,
	},
	{
			"cacharle/c_formatter_42.vim",
			config = function()
					vim.g.c_formatter_42_set_equalprg = 1
			end,
	},
	{
		"42Paris/42header",
		config = function()
			vim.g.user42 = "muabdi"
			vim.g.mail42 = "muabdi@student.42london.com"
		end,
	}
}