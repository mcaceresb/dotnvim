local g = vim.g
local config = require("core.config")

-------------------------------------- globals -----------------------------------------
g.nvchad_load        = false
g.nvchad_theme       = config.ui.theme
g.base46_cache       = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon  = "   "
g.transparency       = config.ui.transparency
g.mapleader          = ","
g.maplocalleader     = " "

-- Disable netrw (vim's built-in file explorer) so it can be taken over by own
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

-------------------------------------- options ------------------------------------------

require "core.options"

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
