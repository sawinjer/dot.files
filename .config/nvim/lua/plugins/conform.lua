return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "eslint_d", "prettierd", "prettier", "biome", stop_after_first = true },
				typescript = { "eslint_d", "prettierd", "prettier", "biome", stop_after_first = true },
				json = { "eslint_d", "prettierd", "prettier", "biome", stop_after_first = true },
				css = { "biome", "prettierd", "prettier", stop_after_first = true },
				php = { "php_cs_fixer" },
				elixir = { "mix" },
				eelixir = { "mix" },
				heex = { "mix" },
				surface = { "mix" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})

		vim.api.nvim_create_user_command("ConformWrite", function(args)
			conform.format({ bufnr = args.buf })
		end, {})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
