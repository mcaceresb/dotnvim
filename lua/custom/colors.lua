-- Color overrides
if vim.g.transparency then
  vim.cmd.highlight({ "Normal",           "guibg=NONE" })
  vim.cmd.highlight({ "Pmenu",            "guibg=NONE" })
  vim.cmd.highlight({ "NormalFloat",      "guibg=NONE" })
  vim.cmd.highlight({ "NotifyBackground", "guibg=NONE" })
end
