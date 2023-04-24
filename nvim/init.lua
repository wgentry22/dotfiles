local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local utils = require("utils")

local install_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

local load_or_notify = function(module)
  local path = "user." .. module
  local load_ok, _ = xpcall(require, utils.errors.handler, path)
  if not load_ok then
    vim.notify("[init.lua] unable to load module `" .. path .. "`")
    return
  end
end

install_lazy()

local modules = {
  "options",
  "plugins",
  "mappings",
  "colorscheme",
  "cmp",
  "lsp",
  "telescope",
  "treesitter",
  "autopairs",
  "comment",
  "gitsigns",
  "nvim-tree",
  "bufferline",
  "toggleterm",
  "lualine"
}

for _, module in ipairs(modules) do
  load_or_notify(module)
end
