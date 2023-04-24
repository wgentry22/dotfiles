local is_available = function(plugin) 
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

return {
  errors = require("utils.errors"),
  is_available = is_available,
}