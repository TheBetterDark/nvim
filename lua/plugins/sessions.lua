return {
	"Shatur/neovim-session-manager",
	config = function()
		local Path = require('plenary.path')
		require('session_manager').setup({
			sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
			path_replacer = '__',
			colon_replacer = '++',
			autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
			autosave_last_session = true,
			autosave_ignore_not_normal = true,
			autosave_ignore_filetypes = {
				'gitcommit',
				'gitrebase',
			},
			autosave_only_in_session = false,
			max_path_length = 80,
		})

		vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<CR>', { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>sl', ':SessionManager load_last_session<CR>', { noremap = true, silent = true })
	end
}
