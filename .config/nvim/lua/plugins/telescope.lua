return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	cmd = "Telescope",
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},
	opts = function(_, opts)
		local actions = require("telescope.actions")
		opts.defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		}
		return opts
	end,
	config = function(_, opts)
		require("telescope").setup(opts)

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[F]ind [W]ord" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<cr>", { desc = "[F]ind To[D]os" })
	end,
}
