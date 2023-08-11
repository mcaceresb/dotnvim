-- NOTE: Plugin to align text based on a particular character I carry
-- NOTE: over tabular from vim, but check out others
-- TODO: Vonr/align.nvim in lua
-- TODO: junegunn/vim-easy-align in vim
return {
  {
    'godlygeek/tabular',
    keys = {
      { mode = "v", "<leader>at",  ":Tabularize /&<CR>", desc = "" },
      { mode = "n", "<leader>at",  ":Tabularize /&<CR>", desc = "" },

      { mode = "v", "<leader>a#",  ":Tabularize /#/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a%",  ":Tabularize /%/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a&",  ":Tabularize /&/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a*",  ":Tabularize /*/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a=",  ":Tabularize /=/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a-",  ":Tabularize /-/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a,",  ":Tabularize /,/l1r1<CR>", desc = "" },
      { mode = "v", '<leader>a"',  ':Tabularize /"/l1r1<CR>', desc = "" },
      { mode = "v", "<leader>a:",  ":Tabularize /:/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a;",  ":Tabularize /;/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a$",  ":Tabularize /$/l1r1<CR>", desc = "" },
      { mode = "v", "<leader>a/",  ":Tabularize /\\/\\/\\+/l1r1<CR>",   desc = "" },
      { mode = "v", "<leader>a\\", ":Tabularize /\\\\\\\\\\+/l1r1<CR>", desc = "" },

      { mode = "n", "<leader>a#",  "mm:Tabularize /#/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a%",  "mm:Tabularize /%/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a&",  "mm:Tabularize /&/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a*",  "mm:Tabularize /*/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a=",  "mm:Tabularize /=/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a-",  "mm:Tabularize /-/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a,",  "mm:Tabularize /,/l1r1<CR>`m", desc = "" },
      { mode = "n", '<leader>a"',  'mm:Tabularize /"/l1r1<CR>`m', desc = "" },
      { mode = "n", "<leader>a:",  "mm:Tabularize /:/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a;",  "mm:Tabularize /;/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a$",  "mm:Tabularize /$/l1r1<CR>`m", desc = "" },
      { mode = "n", "<leader>a/",  "mm:Tabularize /\\/\\/\\+/l1r1<CR>`m",   desc = "" },
      { mode = "n", "<leader>a\\", "mm:Tabularize /\\\\\\\\\\+/l1r1<CR>`m", desc = "" },

      { mode = "v", "<leader>z#",  ":Tabularize /#\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z%",  ":Tabularize /%\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z&",  ":Tabularize /&\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z*",  ":Tabularize /*\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z=",  ":Tabularize /=\\zs/l0r1<CR>", desc = "" },
      { mode = "v", '<leader>z"',  ':Tabularize /"\\zs/l0r1<CR>', desc = "" },
      { mode = "v", "<leader>z:",  ":Tabularize /:\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z;",  ":Tabularize /;\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z$",  ":Tabularize /$\\zs/l0r1<CR>", desc = "" },
      { mode = "v", "<leader>z/",  ":Tabularize /\\/\\/\\+\\zs/l0r1<CR>",   desc = "" },
      { mode = "v", "<leader>z/",  ":Tabularize /\\\\\\\\\\+\\zs/l0r1<CR>", desc = "" },

      { mode = "n", "<leader>z#",  "mm:Tabularize /#\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z%",  "mm:Tabularize /%\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z&",  "mm:Tabularize /&\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z*",  "mm:Tabularize /*\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z=",  "mm:Tabularize /=\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z-",  "mm:Tabularize /-\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z,",  "mm:Tabularize /,\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", '<leader>z"',  'mm:Tabularize /"\\zs/l0r1<CR>`m', desc = "" },
      { mode = "n", "<leader>z:",  "mm:Tabularize /:\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z;",  "mm:Tabularize /;\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z$",  "mm:Tabularize /$\\zs/l0r1<CR>`m", desc = "" },
      { mode = "n", "<leader>z/",  "mm:Tabularize /\\/\\/\\+\\zs/l0r1<CR>`m",   desc = "" },
      { mode = "n", "<leader>z\\", "mm:Tabularize /\\\\\\\\\\+\\zs/l0r1<CR>`m", desc = "" },
    }
  },
  -- {
  --   'junegunn/vim-easy-align'
  -- },
}

-- EasyAlign:
-- xmap ga <Plug>(EasyAlign)
-- nmap ga <Plug>(EasyAlign)
-- let g:easy_align_delimiters = {
--             \   '/': {
--             \     'pattern':         '\/\/\+',
--             \     'delimiter_align': 'l',
--             \   },
--             \   '\': {
--             \     'pattern':         '\\\\\+',
--             \     'delimiter_align': 'l',
--             \     'ignore_groups':   ['!Comment']
--             \   },
--             \   '>': {
--             \     'pattern':       '-\?>\|>>\|=>',
--             \     'left_margin':   1,
--             \     'right_margin':  1,
--             \     'stick_to_left': 0,
--             \     'ignore_groups': ['!Comment']
--             \   },
--             \   '<': {
--             \     'pattern':       '-\?<\|<<\|<=',
--             \     'left_margin':   1,
--             \     'right_margin':  1,
--             \     'stick_to_left': 0,
--             \     'ignore_groups': ['!Comment']
--             \   },
--             \   ';': {
--             \     'pattern':       ';',
--             \     'left_margin':   0,
--             \     'right_margin':  1,
--             \     'stick_to_left': 1,
--             \     'ignore_groups': ['!Comment']
--             \   },
--             \  '%': {
--             \     'pattern':         '%\+',
--             \     'delimiter_align': 'l',
--             \     'ignore_groups':   ['!Comment']
--             \   },
--             \ }
