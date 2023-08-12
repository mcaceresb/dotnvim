-- Collection of ] and [ mappings
return {
  -- the OG
  -- { "tpope/vim-unimpaired" },
  -- lua port of Tim Pope's plugin
  {
    "tummetott/unimpaired.nvim",
    init = function()
      require('unimpaired').setup {
        -- add any options here or leave empty
      }
    end,
  },
}
