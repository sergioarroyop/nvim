--Basic settings

vim.g.mapleader = "C"

vim.wo.relativenumber = false
vim.wo.number = true
vim.o.encoding = "utf-8"
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.hidden = true
vim.o.cmdheight = 1
vim.o.updatetime = 300
vim.o.cursorline = true
vim.o.mouse = "nvi"
vim.o.termguicolors = true

--Mappings
vim.keymap.set("n", "<leader>1", vim.cmd.bfirst)
vim.keymap.set("n", "<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<F5>", function() vim.cmd [[Gitsign preview_hunk]] end)
vim.keymap.set("n", "<F3>", function() vim.cmd [[set nu!]] end)

-- Lazy requirement
require("base.plugins.lazy")
