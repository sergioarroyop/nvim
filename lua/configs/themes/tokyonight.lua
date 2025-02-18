local TOKYONIGHT = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	enable = true,
	opts = {},
	config = function()
		require("tokyonight").setup()
		vim.cmd.colorscheme("tokyonight")
	end,
}

return TOKYONIGHT
