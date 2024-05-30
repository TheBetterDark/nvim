return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set('n', '<leader>tt', ":ToggleTerm<CR>",{})
	end
}
