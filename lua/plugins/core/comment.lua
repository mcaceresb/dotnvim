return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n",         desc = "Comment toggle current line"  },
    { "gbc", mode = "n",         desc = "Comment toggle current block" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise"     },
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise"      },
  },
  opts = function()
    local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
  end,
  init = function()
    require("plugins.config.comment").mappings()
  end,
  config = function(_, opts)
    local ft = require('Comment.ft')
    ft.set('stata', '*%s')
    require("Comment").setup(opts)
  end,
}
