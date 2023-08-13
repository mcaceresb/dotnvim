-- NOTE: Plugin to align text based on a particular character I carry
-- NOTE: over tabular from vim, but check out others
-- Vonr/align.nvim
-- junegunn/vim-easy-align
return {
  'godlygeek/tabular',
  lazy = false,
  init = function()
    require "mappings.align"()
  end,
}
