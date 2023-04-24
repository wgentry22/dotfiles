local ok, null_ls = pcall(require, "null-ls")
if not ok then
  vim.notify("Failed to load null-ls")
  return
end

return {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.completion.spell,
}