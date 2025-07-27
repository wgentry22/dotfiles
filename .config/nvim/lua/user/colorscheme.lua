local settings = {
	flavor = "macchiato",
	colorscheme = "catppuccin-macchiato",
}

return {
	get_flavor = function()
		return settings.flavor
	end,
	get_color_scheme = function()
		return settings.colorscheme
	end,
}
