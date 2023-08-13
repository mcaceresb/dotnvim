-- regex tips, parsing, etc.
-- NOTE: Currently buggy with python/stata flavored regex
return {
  "tomiis4/Hypersonic.nvim",
  lazy = true,
  opts = { enable_cmdline = false },
  keys = {
    { "<LocalLeader>r", ":Hypersonic<CR>", mode = "v",  desc = "regex explanation for selection"  },
  },
  init = function()
    require('hypersonic').setup()
  end,
}
