local M = {}
local map = vim.keymap.set

M.mappings = function()
  map(
    "n",
    "<leader>/",
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    { desc =  "Toggle comment"})

  map(
    "v",
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc =  "Toggle comment"})
end

return M
