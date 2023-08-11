-- ---------------------------------------------------------------------------
-- Program: init.lua
-- Author:  Mauricio Caceres Bravo <mauricio.caceres.bravo@gmail.com>
-- Purpose: 'Modern' (lua-based) NeoVim setup

require "config"
require "config.options"

-- bootstrap lazy.nvim!
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins but override with my own autocmd, mappings, colors
require "plugins"
require "config.mappings"
require "config.autocmd"
require "config.colors"
require "custom.functions"
vim.cmd('source ' .. vim.fn.stdpath "config" .. '/lua/custom/functions.vim')
