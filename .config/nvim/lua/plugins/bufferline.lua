return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			color_icons = vim.g.termguicolors,
			themable = vim.g.termguicolors,
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
}
