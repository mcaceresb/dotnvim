local map = vim.keymap.set

return function ()
  map("v", "<leader>p", ":TREPLSendSelection<CR>",  {desc = "Send selection to REPL" })
  map("n", "<leader>p", ":TREPLSendLine<CR>",       {desc = "Send line to REPL"      })
  map("n", "<A-i>",     ":horizontal Ttoggle<CR>",  {desc = "Toggle horizontal term" })
  map("n", "<A-v>",     ":vertical   Ttoggle<CR>",  {desc = "Toggle vertical term"   })
end
