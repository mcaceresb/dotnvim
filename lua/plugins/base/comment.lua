return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n",         desc = "Comment toggle current line"  },
    { "gbc", mode = "n",         desc = "Comment toggle current block" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise"     },
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise"      },
  },
  opts = require("plugins.configs.comment").opts,
  init = function()
    require "mappings.comment"()
  end,
  config = require("plugins.configs.comment").config,
}
