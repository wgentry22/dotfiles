local _ensure_installed = {
	"bash",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"dockerfile",
	"editorconfig",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"gowork",
	"graphql",
	"hurl",
	"java",
	"javascript",
	"jq",
	"json",
	"luap",
	"latex",
	"make",
	"nginx",
	"sql",
	"yaml",
	"toml",
	"tsx",
	"typescript",
	"xml",
}

local function ensure_installed()
	return _ensure_installed
end

return {
	ensure_installed = ensure_installed,
}
