-- ---------------------------------------------------------------------------
-- Program: init.lua
-- Author:  Mauricio Caceres Bravo <mauricio.caceres.bravo@gmail.com>
-- Notes:  'Modern' (lua) NeoVim setup; theming based on NvChad

require "core"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").install(lazypath)
end
dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

-- load plugins then rest of my settings
-- (load own stuff later to ideally override plugins)
require "plugins"
require "mappings"
require "custom"

-- TODO: Misc
-- ----------

-- fix snippet trigger
-- override modules in statusline for nvchad so it doesn't show in alpha
-- migrate snippets (mainly tex, stata)
-- replace \xx with symbols (delta, sigma, etc.)

-- TODO: language support
-- ----------------------

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
-- xx nvchad lazy      base46 theme
-- xx nvchad etc       base46 theme
-- xx kamykn/spelunker.vim
-- xx rafamadriz/friendly-snippets
-- xx folke/noice.nvim
-- xx uga-rosa/translate.nvim
-- xx potamides/pantran.nvim
-- xx kevinhwang91/nvim-hlslens
-- xx mg979/vim-visual-multi or smoka7/multicursors.nvim
-- xx anuvyklack/windows.nvim
-- xx ldelossa/nvim-ide
-- xx lambdalisue/suda.vim
-- xx Bekaboo/dropbar.nvim
-- xx lazyvim extras
-- xx astrovim
