vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.g.highlighturl_enabled = true
vim.g.diagnostics_mode = 3

-- Ignore netrw in favor of nvim-neo-tree
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("options")
require("keymaps")

require("bootstrap")
