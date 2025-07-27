require("bootstrap.lazy")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	install = {
		colorscheme = {
			require("user.colorscheme").get_color_scheme(),
		},
	},
})
