-- Installed plugins:

-- Nightfox - Plugin Nightfox
-- Telescode - Fuzy Finder for files
-- Nvim TreeSitter - Highlighting and parser for multiple languages
-- Mason - Incredible LSP package manager
-- Mason LSP Config - Bridge between Mason and LSP to make easier its configuration -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- NvimTree - Sidebar file explorer
-- NvimCMP - Autosuggestion plugin
-- Conform - Formater plugin
-- LuaLine - Lua status line editor
-- NeoScroll - Smooth scrolling plugin
-- GitSigns - Show git changes
-- VimLastPlace - Jump to last position when opening file
-- IdentBlankline - Show indent lines
-- Codeium - Code completion

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enable = true,
		opts = {},
		config = function()
			require("tokyonight").setup()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.telescope")
		end,
		--function(_,opts)
		--	    require("telescope").setup(opts)
		--  end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"vim",
					"lua",
					"vimdoc",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"python",
					"yaml",
					"go",
					"json",
					"terraform",
					"hcl",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
		opts = function()
			return require("configs.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("configs.lspconfig")
		end,
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		-- Thank you to Josean for his video https://youtu.be/NL8D8EkphUw?si=3ZAt7ZJ0S1HuDJ_M
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		opts = function()
			return require("configs.nvim-cmp")
		end,
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = { -- configure how nvim-mp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-l>"] = cmp.mapping.select_prev_item(), --previous suggestion
					["<C-Up>"] = cmp.mapping.select_prev_item(), --previous suggestion
					["<C-k>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-Down>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-Left>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Right>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("configs.formating")
		end,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("configs.lualine")
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"karb94/neoscroll.nvim",
		opts = function()
			return require("configs.neoscroll")
		end,
		config = function(_, opts)
			require("neoscroll").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return require("configs.gitsigns")
		end,
	},
	{
		"farmergreg/vim-lastplace",
		opts = function()
			return require("configs.lastplace")
		end,
		config = function(_, opts)
			local ibl = require("ibl")
			ibl.setup(opts)
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "tpope/vim-commentary" },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"smartinellimarco/nvcheatsheet.nvim",
		opts = function()
			return require("configs.nvcheatsheet")
		end,
		config = function(_, opts)
			local nvcheatsheet = require("nvcheatsheet")
			vim.keymap.set("n", "<F1>", nvcheatsheet.toggle)
			require("nvcheatsheet").setup(opts)
		end,
	},
}
