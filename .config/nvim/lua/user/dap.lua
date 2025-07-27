local daps = {
	"delve",
}

local function _ensure_installed()
	return daps
end

return {
	ensure_installed = _ensure_installed,
}
