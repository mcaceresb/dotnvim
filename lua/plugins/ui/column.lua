-- nicer colorcolumn
return {
  -- {
  --   "lukas-reineke/virt-column.nvim",
  --   -- lazy = false,
  --   opts = { char = "▏" },
  --   config = function(_, opts)
  --     vim.opt.colorcolumn = "100"
  --     require("virt-column").setup(opts)
  --   end,
  -- },
  -- highlight VirtColumn
  {
    "xiyaowong/virtcolumn.nvim",
    lazy = false,
    config = function()
      vim.opt.colorcolumn       = "100"
      -- vim.g.virtcolumn_char     = "▏"
      -- vim.g.virtcolumn_char     = "▕"
      -- vim.g.virtcolumn_priority = 10
    end,
  },
}
