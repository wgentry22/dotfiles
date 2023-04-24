return {

	-- Catppuccin Color Scheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			integrations = {
				cmp = true,
				gitsigns = true,
				telescope = true,
				notify = true,
				mini = true,
			},
		},
	},

	-- Useful Lua functions used by many plugins
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},

	-- An implementation of the Popup API
	{
		"nvim-lua/popup.nvim",
		name = "popup",
	},

	-- Auto close parenthesis, quotes, brackets, etc
	{
		"windwp/nvim-autopairs",
		name = "autopairs"
	},

	-- Support for commenting chunks of code
	{
		"numToStr/Comment.nvim",
		name = "Comment"
	},

	{
		'akinsho/bufferline.nvim', 
		version = "v3.*", 
		dependencies = 'nvim-tree/nvim-web-devicons'
	}
}
