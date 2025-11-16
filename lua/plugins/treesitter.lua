return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			-- treesitter setup
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- install parsers asynchronously
			require("nvim-treesitter").install({
				"rust",
				"javascript",
				"python",
				"go",
				"typescript",
				"c",
				"zig",
				"arduino",
				"cmake",
				"css",
				"cpp",
				"csv",
				"dockerfile",
				"gitignore",
				"terraform",
				"tsx",
				"yaml",
				"zsh",
			})
			-- :wait(300000) -- optional: for synchronous bootstrap
		end,
	},
}
