local colorscheme = "catppuccin"

local ok, settings = pcall(require, "user.settings.colorscheme."..colorscheme)
if ok then
	require(colorscheme).setup(settings)
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found! Falling back to default")
	return
end
