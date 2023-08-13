return {
  "goolord/alpha-nvim",
  dependencies = {
    'rmagatti/auto-session',
    'mhinz/vim-startify',
  },
  event  = "VimEnter",
  opts   = require("plugins.configs.alpha").opts,
  config = require("plugins.configs.alpha").config,
}
