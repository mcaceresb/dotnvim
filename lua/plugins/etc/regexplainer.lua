-- regex tips, parsing, etc.
return {
  "bennypowers/nvim-regexplainer",
  lazy = true,
  opts = {
    auto = false,
    mode = 'narrative', -- TODO: 'ascii', 'graphical'
  },
  keys = {
    { "<LocalLeader>r", ":RegexplainerShowPopup<CR>", mode = "v",  desc = "regex explanation for selection"  },
  },
  init = function(_, opts)
    require('regexplainer').setup(opts)
  end,
}
