-- Pop-up search for all the things
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "rmagatti/session-lens",
  },
  cmd = "Telescope",
  init = function()
    require "mappings.telescope"()
  end,
  opts = function()
    return require "plugins.configs.telescope"
  end,
  config = function(_, opts)
    if vim.g.nvchad_load then
      dofile(vim.g.base46_cache .. "telescope")
    end
    local telescope = require "telescope"
    telescope.setup(opts)

    -- load extensions
    for _, ext in ipairs(opts.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
