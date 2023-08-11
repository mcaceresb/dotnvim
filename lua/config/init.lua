local g = vim.g

---------------------------------------- globals -----------------------------------------
g.transparency   = true
g.mapleader      = ","
g.maplocalleader = " "
g.base46_cache   = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- Disable netrw (vim's built-in file explorer)
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

------------------------------------------ misc ------------------------------------------
-- TODO; xx disable some default providers but does it break anything?
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- TODO; xx add binaries installed by mason.nvim to path
-- local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
-- vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
