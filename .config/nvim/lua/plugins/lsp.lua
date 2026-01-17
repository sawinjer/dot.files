return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					source = "always",
				},
				float = {
					source = "always",
				},
			})

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Use LspAttach autocmd for reliable keymap setup
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local opts = { noremap = true, silent = true, buffer = ev.buf }
					local keymap = vim.keymap

					keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
					keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
					keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
					keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
					keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
					keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
					keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
					keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
					keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
					keymap.set("n", "<leader>oe", vim.diagnostic.open_float)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.name == "ts_ls" then
						keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
						keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)
					end
				end,
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			definition = {
				edit = "<CR>",
			},
			ui = {
				colors = {
					normal_bg = "#022746",
				},
			},
		},
	},
}
