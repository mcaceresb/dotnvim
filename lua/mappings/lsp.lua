local merge = function(...) vim.tbl_deep_extend("force", ...) end
local map   = vim.keymap.set

return function(opts)
  map(
    "n",
    "[d",
    function()
      vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    merge({ desc = "Goto prev", expr = true }, opts or {}))

  map(
    "n",
    "]d",
    function()
      vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    merge({ desc = "Goto next", expr = true }, opts or {}))
end
