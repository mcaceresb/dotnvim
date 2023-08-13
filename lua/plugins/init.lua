local config = require("plugins.configs.lazy")
require("lazy").setup({

  -- ------------------
  -- import plugin sets
  -- ------------------

  { import = 'plugins.base' }, -- base utilities
  { import = 'plugins.ui'   }, -- custom ui components
  { import = 'plugins.lang' }, -- custom language support

  -- ---------------------------
  -- misc plugins, one at a time
  -- ---------------------------

  { "Asheq/close-buffers.vim", cmd  = "Bdelete" }, -- delete buffers
  { "tpope/vim-abolish"      }, -- match multi-case in find/replace
  { "tpope/vim-speeddating"  }, -- make vim +/- work with dates
  { "tpope/vim-repeat"       }, -- extend .
  { "tommcdo/vim-exchange"   }, -- easier text swap; replace? gbprod/substitute.nvim
  { "salsifis/vim-transpose" }, -- transpose text arrays by delimiter

  require "plugins.etc.pencil",
  require "plugins.etc.todo",
  require "plugins.etc.align",
  require "plugins.etc.mini.indentscope",
  require "plugins.etc.coloritis",
  require "plugins.etc.cheatsheet",
}, config)
