-- Pop-up search for all the things
return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter" ,
    {
      "rmagatti/session-lens" ,
      opts = {
        theme      = nil,
        theme_conf = { winblend = nil },
        previewer  = false,
      },
      config = function(_, opts)
        require('session-lens').setup(opts)
      end
    },
    "rmagatti/auto-session",
  },
  cmd = "Telescope",
  config = function()
    local config = require("plugins.config.telescope")
    -- TODO: xx make a congruent theme
    -- dofile(vim.g.base46_cache .. "telescope")
    local telescope = require "telescope"
    telescope.setup(config.options)

    -- load extensions
    for _, ext in ipairs(config.options.extensions_list) do
      telescope.load_extension(ext)
    end
    config.mappings()
  end,
}
