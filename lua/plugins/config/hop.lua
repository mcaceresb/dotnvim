local M = {}
local map = vim.keymap.set

M.mappings = function ()
  map("n", "<LocalLeader>w", "<cmd> HopWordAC <CR>", { desc = "Hop to word after cursor"              })
  map("n", "<LocalLeader>b", "<cmd> HopWordBC <CR>", { desc = "Hop to word before cursor"             })
  map("n", "<LocalLeader>j", "<cmd> HopLineAC <CR>", { desc = "Hop to line after cursor"              })
  map("n", "<LocalLeader>k", "<cmd> HopLineBC <CR>", { desc = "Hop to line before cursor"             })
  map("n", "<LocalLeader>W", "<cmd> HopWordMW <CR>", { desc = "Hop to word after across buffers"      })
  map("n", "<LocalLeader>J", "<cmd> HopLineMW <CR>", { desc = "Hop to line after across buffers"      })
  map("n", "<LocalLeader>S", "<cmd> HopChar2MW<CR>", { desc = "Hop to two chars after across buffers" })
  map("n", "<LocalLeader>s", "<cmd> HopChar2 <CR>",  { desc = "Hop to two characters"                 })
  -- sneak-like motions
  -- map("n", "S", "<cmd> HopChar2MW<CR>", { desc = "Hop to two chars after across buffers" })
  -- map("n", "s", "<cmd> HopChar2 <CR>",  { desc = "Hop to two characters"                 })
end

return M
