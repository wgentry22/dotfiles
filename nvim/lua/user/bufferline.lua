local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify("Failed to require bufferline")
  return
end

local found, settings = pcall(require, "user.settings.bufferline")
if not found then
  vim.notify("Failed to locate bufferline user settings")
  return
end

bufferline.setup(settings)