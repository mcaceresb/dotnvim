-- NOTE: Plugin to align text based on a particular character I carry
-- NOTE: over tabular from vim, but check out others
-- Vonr/align.nvim
-- junegunn/vim-easy-align
return {
  'godlygeek/tabular',
  init = function()
    require "mappings.align"()
  end,
}
