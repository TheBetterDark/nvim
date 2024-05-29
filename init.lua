vim.cmd("set number")
vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "AlexvZyl/nordic.nvim", lazy = false, priority = 1000, config = function() require("nordic").load() end },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n' , "<C-p>", builtin.find_files, {})
vim.keymap.set('n' , "<leader>fg", builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "c"},
	highlight = { enable = true },
	indent = { enable = true }
})