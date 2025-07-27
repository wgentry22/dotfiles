vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "Write Buffer" })

-- Ergonomic way to exit terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Ergonomic way to enter terminal mode
vim.keymap.set("n", "<M-t>", "<cmd>terminal<cr>", { desc = "Open Terminal Mode" })

-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "move focus to upper window" })

-- Split Resizing
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize +1<cr>", { desc = "Decrease Width of Split" })
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize -1<cr>", { desc = "Increase Width of Split" })
vim.keymap.set("n", "<M-j>", "<cmd>resize -1<cr>", { desc = "Decrease Height of Split" })
vim.keymap.set("n", "<M-k>", "<cmd>resize +1<cr>", { desc = "Increase Height of Split" })

-- Better Splits
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "-", "<cmd>split<cr>", { desc = "Horizontal Split" })
