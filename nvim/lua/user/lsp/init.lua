local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("unable to load lspconfig")
  return
end

require("user.lsp.installer").setup()
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")