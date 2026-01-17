return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"clangd",
				"gopls",
				"marksman", -- markdown
				"ruff", -- python
				"rust_analyzer",
				"sqls",
				"yamlls",
				"taplo", -- toml
				"emmet_ls",
				"somesass_ls",
				"ts_ls",
				"lua_ls",
				"pylsp",
				"vuels",
				"elixirls",
				"docker_compose_language_service",
				"docker_language_server",
				"dockerls",
			},
			automatic_enable = true,
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"biome",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
