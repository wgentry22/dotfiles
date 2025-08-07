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
		"folke/trouble.nvim",
	},
	opts = function(_, opts)
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			hl_group = "lualine_c_normal",
		})

		local o = {
			theme = require("user.colorscheme").get_color_scheme(),
			sections = {
				lualine_c = {
					fileName,
					{
						symbols.get,
						cond = symbols.has,
					},
				},
				lualine_x = {
					"encoding",
					"fileformat",
				},
				lualine_z = {},
			},
		}

		return vim.tbl_deep_extend("force", opts, o)
	end,
}
