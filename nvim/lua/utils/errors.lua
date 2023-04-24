local M = {}

M.handler = function(err)
  vim.notify("Caught error: "..err)
  vim.notify(debug.traceback())
end

return M