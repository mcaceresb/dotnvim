local map = vim.keymap.set

return function()
  map("n", "<F10>", "<cmd> Neotree toggle=true <CR>", { desc = "Toggle neotree" })
end
