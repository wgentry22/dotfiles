return {
	"nvim-neo-tree/neo-tree.nvim",
	ft = "netrw",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<A-1>", ":Neotree reveal left<CR>", desc = "NeoTree Reveal Left", silent = true },
		{ "<leader>q", ":Neotree reveal current<CR>", desc = "NeoTree Reveal", silent = true },
	},
	opts = {
		mappings = {
			["<CR>"] = { "toggle_node" },
		},
		filesystem = {
			hijack_netrw_behavior = "open_current",
			window = {
				position = "left",
				mappings = {
					["<A-1>"] = "close_window",
					["<leader>q"] = "close_window",
				},
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
			callback = function()
				local f = vim.fn.expand("%:p")
				if vim.fn.isdirectory(f) ~= 0 then
					vim.cmd("Neotree current dir=" .. f)

					vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
				end
			end,
		})
	end,
}
