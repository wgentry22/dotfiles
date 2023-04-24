local is_available = require("utils").is_available
local wk_avail, wk = pcall(require, "which-key")
if not wk_avail then
  vim.notify("which-key not available")
  return
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
  f = { desc = "󰍉 Find" },
  p = { desc = "󰏖 Packages" },
  l = { desc = " LSP" },
  u = { desc = " UI" },
  b = { desc = "󰓩 Buffers" },
  bs = { desc = "󰒺 Sort Buffers" },
  d = { desc = " Debugger" },
  g = { desc = " Git" },
  S = { desc = "󱂬 Session" },
  t = { desc = " Terminal" },
}

-- Normal --
-- Standard Operations
maps.n["j"] = { "v:count == 0 || mode(1)[0:1] == 'no' ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count == 0 || mode(1)[0:1] == 'no' ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
maps.n["<leader>w"] = { "<cmd>w<cr>", "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", "Horizontal Split" }

-- Plugin Manager
maps.n["<leader>p"] = sections.p
maps.n["<leader>pi"] = { function() require("lazy").install() end, "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, "Plugins Update" }

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Comment line",
  }
  maps.v["<leader>/"] =
    { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
end

-- Nvim Tree
if is_available "nvim-tree.lua" then
  maps.n["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" }
  maps.n["<leader>o"] = { "<cmd>NvimTreeFocus<cr>", "Toggle Explorer Focus" }
end

-- SymbolsOutline
if is_available "aerial.nvim" then
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>lS"] = { function() require("aerial").toggle() end, "Symbols outline" }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>f"] = sections.f
  maps.n["<leader>g"] = sections.g
  maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, "Git branches" }
  maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end,  "Git commits" }
  maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, "Git status" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end,  "Find files" }
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end,  "Find words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    "Find words in all files",
  }
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, "Search diagnostics" }
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    "Search symbols",
  }
end


for mode, mapping_for_mode in pairs(maps) do
  wk.register(mapping_for_mode, { mode = mode })
end