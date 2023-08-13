local M = {}

M.opts = function()
  local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
  return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
end

M.config = function(_, opts)
  local ft = require('Comment.ft')
  ft.set('stata', '*%s')
  require("Comment").setup(opts)
end

return M
