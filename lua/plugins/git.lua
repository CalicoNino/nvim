return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
}
