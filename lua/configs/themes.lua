local theme_modules = {}
local theme_names = {}

local themes_path = "configs.themes"
local themes_dir = vim.fn.stdpath("config") .. "/lua/configs/themes"

local scan = vim.loop.fs_scandir(themes_dir)
if scan then
	while true do
		local name, type = vim.loop.fs_scandir_next(scan)
		if not name then
			break
		end

		local module_name = themes_path .. "." .. name:gsub("%.lua$", "")
		local theme_config = require(module_name)

		table.insert(theme_modules, theme_config)

		local theme_name = name:gsub("%.lua$", "") -- "monokai-pro.lua" -> "monokai-pro"
		table.insert(theme_names, theme_name)
	end
end

local flattened_modules = {}
for _, theme in ipairs(theme_modules) do
	table.insert(flattened_modules, theme)
end

return {
	modules = flattened_modules,
	names = theme_names,
}
