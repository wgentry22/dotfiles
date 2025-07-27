return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = require("user.colorscheme").get_flavor(),
			integrations = {
				bufferline = true,
				cmp = true,
				dap = true,
				dap_ui = true,
				gitsigns = true,
				lsp_trouble = true,
				markdown = true,
				mason = true,
				mini = { enabled = true },
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				navic = {
					enabled = true,
					custom_bg = "lualine",
				},
				noice = true,
				notify = true,
				neotree = true,
				symbols_outline = true,
				semantic_tokens = true,
				telescope = { enabled = true },
				treesitter = true,
				snacks = {
					enabled = true,
				},
			},
		})

		vim.cmd.colorscheme(require("user.colorscheme").get_color_scheme())

		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
	end,
}
