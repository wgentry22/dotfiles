local function fileName()
	-- First, trim the pattern relative to the current
	-- directory. For other options, see `:h
	-- filename-modifiers`.
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	if filename == "" then
		return "[No Name]"
	end

	return filename
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
	},
	opts = {
		theme = require("user.colorscheme").get_color_scheme(),
		sections = {
			lualine_c = { fileName },
			lualine_x = {
				{
					function()
						return require("nvim-navic").get_location()
					end,
					cond = function()
						return require("nvim-navic").is_available()
					end,
				},
				"encoding",
				"fileformat",
			},
			lualine_z = {},
		},
	},
}
