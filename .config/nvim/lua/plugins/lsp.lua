return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
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
				keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

				if client.name == "ts_ls" then
					keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
					keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)
				end
			end

			-- Apply to all LSP servers
			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
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
