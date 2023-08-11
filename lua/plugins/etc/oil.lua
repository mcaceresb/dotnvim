local map = vim.keymap.set

return {
  "stevearc/oil.nvim",
  init = function()
    require("oil").setup()
  end,
}
