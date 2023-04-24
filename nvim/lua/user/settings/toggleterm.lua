return {
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  shading_factor = 2,
  float_opts = {
    border = "curved",
    highlights = { border = "Normal", background = "Normal" },
  },
}