-- highlight comments with TODO, NOTE, BUG, etc. and make them searchable
-- TODO: example
-- BUG:  example
-- FIX:  example
-- NOTE: example
-- HACK: example
-- WARN: example
-- PERF: example
-- TEST: example
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
    gui_style = {
      fg = "bold",
      bg = "NONE",
    },
    keywords = {
      NOTE = { icon = "" },
      TODO = { icon = "✗", color = "error" },
    },
    highlight = {
      multiline = false,
      keyword = "bg",
    },
  }
}
