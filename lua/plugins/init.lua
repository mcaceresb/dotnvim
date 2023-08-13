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

-- TODO: language support
-- ----------------------

-- gitsign delete file to red minus/red minus block, not a plain colorb lock
-- gitsign added line to a green plus/plus cute block, not a vertical line
-- you should actually divorce mappings from config, no?
-- fix snippet trigger
-- migrate snippets (mainly tex, stata)
-- replace \xx with symbols (delta, sigma, etc.)
-- lsp for python, tex, R, stata
-- 'mzlogin/vim-markdown-toc', {'as' : 'markdown-toc'}
-- 'JuliaLang/julia-vim',      {'as' : 'julia'}
-- 'google/yapf',              {'rtp': 'plugins/vim',  'for': 'python'}
-- 'vim-scripts/SAS-Syntax',   {'as' : 'sas',          'for' : 'sas'}
-- 'jalvesaq/Nvim-R',          {'as' : 'rplugin',      'for' : 'r'}
-- 'lervag/vimtex',            {'as' : 'vimtex',       'for' : 'tex'}
--
-- language let  g:bundle_path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/bundle/'
-- language Plug g:bundle_path . 'latex-fenced-languages', {'for' : 'tex'}
-- language Plug g:bundle_path . 'latex-suite-folding',    {'for' : 'tex'}

-- TODO: Check these out!
-- ----------------------

-- xx nvchad telescope base46 theme
-- xx nvchad lazy base46 theme
-- xx rafamadriz/friendly-snippets
-- xx folke/noice.nvim
-- xx uga-rosa/translate.nvim
-- xx potamides/pantran.nvim
-- xx kevinhwang91/nvim-hlslens
-- xx mg979/vim-visual-multi or smoka7/multicursors.nvim
-- xx anuvyklack/windows.nvim
-- xx ldelossa/nvim-ide
-- xx lambdalisue/suda.vim
-- xx lazyvim extras
-- xx astrovim
