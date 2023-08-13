-- indentation guides
return {
  "lukas-reineke/indent-blankline.nvim",
  -- version = "2.20.7",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    return require("plugins.configs.blankline")
  end,
  config = function(_, opts)
    require "mappings.blankline"()
    if vim.g.nvchad_load then
      dofile(vim.g.base46_cache .. "blankline")
    end
    require("indent_blankline").setup(opts)
  end,
}
