return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			message_template = " <summary> • <date> • <author>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
