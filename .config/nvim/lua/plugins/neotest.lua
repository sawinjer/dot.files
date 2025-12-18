return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>tr", "<cmd>Neotest run<cr>" },
		{ "<leader>tx", "<cmd>lua require('neotest').run.stop()<cr>" },
		{ "<leader>ti", "<cmd>Neotest output<cr>" },
		{ "<leader>ts", "<cmd>Neotest summary<cr>" },
		{ "<leader>tp", "<cmd>NeotestPlaywrightPreset<cr>" },
		{ "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
	},
}
