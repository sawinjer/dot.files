return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				adaptive_size = true,
			},
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
		require("lsp-file-operations").setup()
	end,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		{ "<leader>ff", "<cmd>NvimTreeFindFile<cr>", desc = "Focus File" },
	},
}
