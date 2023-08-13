-- TODO: move to ../ui/colorizer.lua if it works out
return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
    require("colortils").setup()
  end,
}
