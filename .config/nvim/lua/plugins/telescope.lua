return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = {
			"Telescope",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"node%_modules/.*",
						"target/.*",
						".git/.*",
						".vscode/.*",
						".next/.*",
						".idea/.*",
						"data/.*",
						"dist/.*",
						"build/.*",
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
		keys = {
			{ "<leader><leader>", "<cmd>Telescope find_files<cr>" }, -- find files within current working directory, respects .gitignore
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" }, -- find string in current working directory as you type
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>" }, -- find string under cursor in current working directory
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" }, -- list open buffers in current neovim instance
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" }, -- list available help tags
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>" }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
			{ "<leader>gb", "<cmd>Telescope git_bcommits<cr>" }, -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
			{ "<leader>gs", "<cmd>Telescope git_status<cr>" }, -- list current changes per file with diff preview ["gs" for git status]
		},
	},
}
