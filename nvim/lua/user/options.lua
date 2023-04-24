local options = {
	opt = {
		backup = false,
		clipboard = "unnamedplus",
		cmdheight = 2,
		completeopt = { "menuone", "noselect" }, -- mostly just for cmp
		fileencoding = "utf-8",
		hlsearch = true,
		ignorecase = true,
		pumheight = 10,
		showmode = true,
		showtabline = 2,
		smartcase = true,
		smartindent = true,
		splitbelow = true,
		splitright = true,
		undofile = true,
		updatetime = 300,
		termguicolors = true,
		writebackup = false,
		expandtab = true,
		shiftwidth = 2,
		tabstop = 2,
		cursorline = true,
		number = true,
		relativenumber = true,
		numberwidth = 4,
		signcolumn = "yes",
		wrap = true,
	},
	g = {
		highlighturl_enabled = true, -- highlight URLs by default
    mapleader = " ", -- set leader key,
		codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
    lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
		nvim_tree_indent_markers = 1,
	}
}

for scope, table in pairs(options) do 
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
