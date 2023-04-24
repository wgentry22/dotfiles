local ok, lualine = pcall(require, "lualine")
if not ok then 
  vim.notify("Failed to require lualine")
  return
end

local found, settings = pcall(require, "user.settings.lualine")
if not found then 
  vim.notify("Failed to require user settings for Lualine - falling back to default")
  settings = {}
end

lualine.setup(settings)