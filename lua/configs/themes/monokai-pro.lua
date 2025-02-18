local MONOKAI = {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	enable = true,
	opts = {},
	config = function()
		require("monokai-pro").setup({
			-- ...
			--- @param filter "machine"
			override = function(c)
				return {
					IndentBlanklineChar = { fg = c.base.dimmed4 },
				}
			end,
			overridePalette = function(filter)
				return {
					dark2 = "#101014",
					dark1 = "#16161E",
					background = "#3a4449",
					accent1 = "#f7768e",
					accent2 = "#7aa2f7",
					accent3 = "#e0af68",
					accent4 = "#9ece6a",
					accent5 = "#0DB9D7",
					accent6 = "#9d7cd8",
				}
			end,
			-- ...
		})
		vim.cmd.colorscheme("monokai-pro")
	end,
}

return MONOKAI
