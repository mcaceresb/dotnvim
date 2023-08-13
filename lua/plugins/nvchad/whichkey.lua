-- Only load whichkey after all the gui
return {
  "folke/which-key.nvim",
  keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
  init = function()
    require("core.utils").load_mappings "whichkey"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
  end,
}
