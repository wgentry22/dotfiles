local M = {}

M.setup = function()
  local lspconfig = require("lspconfig")
  local servers = require("plugins.configs.lsp_servers")
  local handlers = require("user.lsp.handlers")
  for _, server in ipairs(servers) do
    local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities
    }

    server = vim.split(server, "@")[1]
    local found, custom_config = pcall(require, "user.lsp.servers."..server)
    if found then
      opts = vim.tbl_deep_extend("force", custom_config, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return M