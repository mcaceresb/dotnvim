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

-- TODO: language support
-- ----------------------

-- spell should select the first word and not close the dialogue
-- max tabline widt
-- migrate snippets (mainly tex, stata)
-- lsp for python, tex, R, stata
-- 'google/yapf', {'rtp': 'plugins/vim', 'for': 'python'}
-- 'mzlogin/vim-markdown-toc', {'as' : 'markdown-toc'}
-- 'vim-scripts/SAS-Syntax', {'as' : 'sas', 'for' : 'sas'}

-- TODO: Check these out!
-- ----------------------

-- xx nvchad telescope base46 theme
-- xx nvchad lazy      base46 theme
-- xx nvchad etc       base46 theme
-- xx rockerBOO/awesome-neovim
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
