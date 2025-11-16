return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Go forward/backward with square brackets
	{ 'nvim-mini/mini.nvim', version = false },

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},

	-- -- copilot
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	opts = {
	-- 		suggestion = {
	-- 			auto_trigger = true,
	-- 			keymap = {
	-- 				accept = "<C-l>",
	-- 				accept_word = "<M-l>",
	-- 				accept_line = "<M-S-l>",
	-- 				next = "<M-]>",
	-- 				prev = "<M-[>",
	-- 				dismiss = "<C-]>",
	-- 			},
	-- 		},
	-- 		filetypes = {
	-- 			markdown = true,
	-- 			help = true,
	-- 		},
	-- 	},
	-- },
}
