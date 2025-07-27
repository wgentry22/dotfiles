-- Line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

-- Use Treesitter for Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

-- Sync clipboard between OS and Neovim
-- Scheduled to increase startup time
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.o.laststatus = 3
vim.o.showcmdloc = "statusline"
