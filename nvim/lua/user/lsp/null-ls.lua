local ok, null_ls = pcall(require, "null-ls")
if not ok then
  vim.notify("Failed to load null-ls")
  return
end

local sources = require("user.settings.null-ls-sources")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach
})