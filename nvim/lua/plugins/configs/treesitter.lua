-- can be an array as well { "c", "lua", "vim", "vimdoc", "query" }
local _ensure_installed = "all" -- Or "maintained"

local _ignore_install = {""}

return {
  ensure_installed = function()
    return _ensure_installed
  end,
  ignore_install = function()
    return _ignore_install
  end,
}