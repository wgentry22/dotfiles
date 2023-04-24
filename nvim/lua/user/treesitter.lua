local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Failed to require `nvim-treesitter.configs`")
  return
end

local opts = require("user.settings.treesitter")

configs.setup(opts)