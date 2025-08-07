return {
	{
		-- Lua LSP for Neovim Config
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updated for LSP
			{ "j-hui/fidget.nvim", opts = {} },

			-- Extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = require("user.lsp").autocmd_callback,
			})

			vim.diagnostic.config(require("user.lsp").diagnostic_config())

			local capabilities = vim.tbl_deep_extend(
				"force",
				require("lspconfig").util.default_config,
				require("blink.cmp").get_lsp_capabilities()
			)
			capabilities = vim.tbl_deep_extend("force", capabilities, vim.lsp.protocol.make_client_capabilities() or {})
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())

			require("mason").setup()

			require("mason-tool-installer").setup({
				ensure_installed = require("user.lsp").ensure_installed(),
			})

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- Installed via mason-tool-installer
				automatic_installation = false,
				handlers = {
					-- Default handler
					function(server_name)
						local server = require("user.lsp").server_config(server_name)

						server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
