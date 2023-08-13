return {
  -- NvChad color library
  {
    "NvChad/base46",
    enabled = vim.g.nvchad_load,
    branch = "v2.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  -- NvChad ui components
  {
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
    enabled = true,
  },
}
