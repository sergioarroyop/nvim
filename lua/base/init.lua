--Basic settings
local o = vim.o
local key = vim.keymap

vim.g.mapleader = "C"

vim.wo.relativenumber = false
vim.wo.number = true
o.encoding = "utf-8"
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.hidden = true
o.cmdheight = 1
o.updatetime = 300
o.cursorline = true
o.mouse = ""
o.termguicolors = true

-- Extra configs
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

--Mappings
key.set("n", "<leader>1", vim.cmd.bfirst)
key.set("n", "<leader>0", vim.cmd.blast)
key.set("n", "<Tab>", vim.cmd.bnext)
key.set("n", "<S-Tab>", vim.cmd.bprevious)
key.set("n", "<F5>", function()
	vim.cmd([[Gitsign preview_hunk]])
end)
key.set("n", "<F3>", function()
	vim.cmd([[set nu!]])
end)

-- Lazy requirement
require("base.plugins.lazy")
