local map = vim.keymap.set

return function()
  map("n", "<leader>li", "<Plug>(vimtex-info)")
  map("n", "<leader>lI", "<Plug>(vimtex-info-full)")
  map("n", "<leader>lt", "<Plug>(vimtex-toc-open)")
  map("n", "<leader>lT", "<Plug>(vimtex-toc-toggle)")
  map("n", "<leader>lq", "<Plug>(vimtex-log)")
  map("n", "<leader>lv", "<Plug>(vimtex-view)")
  map("n", "<leader>lr", "<Plug>(vimtex-reverse-search)")
  map("n", "<leader>ll", "<Plug>(vimtex-compile)")
  map("n", "<leader>lL", "<Plug>(vimtex-compile-selected)")
  map("n", "<leader>lk", "<Plug>(vimtex-stop)")
  map("n", "<leader>lK", "<Plug>(vimtex-stop-all)")
  map("n", "<leader>le", "<Plug>(vimtex-errors)")
  map("n", "<leader>lo", "<Plug>(vimtex-compile-output)")
  map("n", "<leader>lg", "<Plug>(vimtex-status)")
  map("n", "<leader>lG", "<Plug>(vimtex-status-all)")
  map("n", "<leader>lc", "<Plug>(vimtex-clean)")
  map("n", "<leader>lC", "<Plug>(vimtex-clean-full)")
  map("n", "<leader>lm", "<Plug>(vimtex-imaps-list)")
  map("n", "<leader>lx", "<Plug>(vimtex-reload)")
  map("n", "<leader>lX", "<Plug>(vimtex-reload-state)")
  map("n", "<leader>ls", "<Plug>(vimtex-toggle-main)")
end
