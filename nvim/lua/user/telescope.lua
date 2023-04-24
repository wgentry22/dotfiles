local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("Failed to require telescope")
  return
end

local extensions = {
  'aerial',
  'fzf'
}

for _, extension in ipairs(extensions) do
  local loadedOk, _ = pcall(telescope.load_extension, extension)
  if not loadedOk then
    vim.notify("Failed to load Telescope Extension `"..extension.."`")
  end
end

