local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("Failed to require nvim-tree")
  return
end

local found, settings = pcall(require, "user.settings.nvim-tree")
if not found then
  vim.notify("Failed to find user settings for nvim-tree")
  return
end

nvim_tree.setup(settings)