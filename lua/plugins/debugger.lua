return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"cpptools",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			require("dapui").setup()
			require("dap.ext.vscode").load_launchjs(nil, {})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
			  dapui.open()
			end

			vim.fn.sign_define('DapBreakpoint',{ text ='🛑', texthl ='', linehl ='', numhl =''})
			vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
			vim.fn.sign_define('DapBreakpointRejected', { text = '⚠️', texthl = 'LspDiagnosticsSignWarning', linehl = '', numhl = '' })

			vim.keymap.set('n', '<F5>', dap.continue)
			vim.keymap.set('n', '<F10>', dap.step_over)
			vim.keymap.set('n', '<F11>', dap.step_into)
			vim.keymap.set('n', '<F12>', dap.step_out)
			vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

			vim.keymap.set('n', '<leader>do', dapui.toggle)
		end
	},
}
