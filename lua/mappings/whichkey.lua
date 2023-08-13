local map = vim.keymap.set

return function ()
  map(
    "n",
    "<LocalLeader>wK",
    function()
      vim.cmd "WhichKey"
    end,
    { desc = "Which-key all keymaps" })

  map(
    "n",
    "<LocalLeader>wk",
    function()
      local input = vim.fn.input "WhichKey: "
      vim.cmd("WhichKey " .. input)
    end,
    { desc = "Which-key query lookup" })
end
