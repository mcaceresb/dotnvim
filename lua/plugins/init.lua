-- Lazy options:
-- lazy=false,    -- Force load plugin on startup
-- enabled=false, -- Disable plugin
-- priority=1000, -- Setup plugin priority

require("lazy").setup({

  -- -----------------------------
  -- plugins used by other plugins
  -- -----------------------------

  { "nvim-tree/nvim-web-devicons", lazy = true }, -- icons
  { "MunifTanjim/nui.nvim",        lazy = true }, -- ui components library
  { "nvim-lua/plenary.nvim",       lazy = true }, -- misc module

  -- ------------------
  -- import plugin sets
  -- ------------------

  { import = 'plugins.ui'   }, -- ui components
  { import = 'plugins.core' }, -- core utilities
  { import = 'plugins.lang' }, -- custom language support

  -- ---------------------------
  -- misc plugins, one at a time
  -- ---------------------------

  { "Asheq/close-buffers.vim", cmd  = "Bdelete" }, -- delete buffers
  { "tpope/vim-abolish"         }, -- match multi-case in find/replace
  { "tpope/vim-speeddating"     }, -- make vim +/- work with dates
  { "tpope/vim-repeat"          }, -- extend .
  { "tommcdo/vim-exchange"      }, -- easier text swap; replace? gbprod/substitute.nvim
  { "salsifis/vim-transpose"    }, -- transpose text arrays by delimiter

  -- useful if new to vim/have trouble remembering mappings
  -- require "plugins.etc.cheatsheet", -- open with <leader>?

  require "plugins.etc.pencil",
  require "plugins.etc.todo",
  require "plugins.etc.align",
  require "plugins.etc.mini.indentscope",
  require "plugins.etc.neotree",

})
-- }, { change_detection = { notify = false }})
