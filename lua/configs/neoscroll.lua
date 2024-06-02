neoscroll = require('neoscroll')

local keymap = {
	["<C-Down>"] = function() neoscroll.ctrl_d({ duration = 210 }) end,
	["<C-Up>"]   = function() neoscroll.ctrl_u({ duration = 210 }) end,
}

local modes = { 'n', 'v', 'x' }

for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end

return {
	mappings = {},
	hide_cursor = true,   -- Hide cursor while scrolling
	stop_eof = true,      -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing = 'linear',    -- Default easing function
	pre_hook = nil,       -- Function to run before the scrolling animation starts
	post_hook = nil,      -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
}
