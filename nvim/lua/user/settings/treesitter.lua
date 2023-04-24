local ok, treesitter_configs = pcall(require, "plugins.configs.treesitter")
if not ok then
  vim.notify("Failed to load treesitter plugin configs")
  return
end

return {
  ensure_installed = treesitter_configs.ensure_installed(),
  sync_install = false, 
  ignore_install = treesitter_configs.ignore_install(), -- List of parsers to ignore installing
  highlight = { 
    enable = true,
    disable = {""}, -- list of languages to be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  incremental_selection = { 
    enable = true
  },
  indent = { 
    enable = true,
    disable = {"yaml"}
  },
  autotag = { 
    enable = true
  },
  context_commentstring = { 
    enable = true, 
    enable_autocmd = false 
  },
}