local base = require("config.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "describe", "it" },
						},
					},
				},
			})

			lspconfig.clangd.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
			})

			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics,
				{
					underline = true,
					virtual_text = {
						spacing = 4
					},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
			},
		},
	},
}
