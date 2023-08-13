local map = vim.keymap.set

return function ()
  map("n", "<F9>", "<cmd>UndotreeToggle<CR>", {desc = "Toggle undo tree" })
end
