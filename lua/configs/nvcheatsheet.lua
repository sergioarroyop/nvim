return {
	header = {
		"                                      ",
		"                                      ",
		"                                      ",
		"█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
		"█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
		"                                      ",
		"                                      ",
		"                                      ",
	},

	keymaps = {
		["Globals"] = {
			{ "Leader", "Space" },
		},
		["Comment"] = {
			{ "Comment line toggle", "gcc" },
			{ "Comment block toggle", "gbc" },
			{ "Comment visual selection", "gc" },
			{ "Comment visual selection using block delimiters", "gb" },
			{ "Comment out text object line wise", "gc<motion>" },
			{ "Comment out text object block wise", "gb<motion>" },
			{ "Add comment on the line above", "gcO" },
			{ "Add comment on the line below", "gco" },
			{ "Add comment at the end of line", "gcA" },
		},
	},
}
