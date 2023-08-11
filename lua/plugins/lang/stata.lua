-- stata support
return {
  {
    dir = vim.fn.stdpath("config") .. "/custom/stata-jump-program",
    ft = { "stata" },
  },
}
