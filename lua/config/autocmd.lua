-- Auto-commands
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "lua", "tex", "r" },
  callback = function(args)
    vim.opt_local.tabstop     = 2
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- weird bug https://github.com/neovim/neovim/issues/21856
autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart('', {detach=true})
  end,
})

-- [xx port?]
-- autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'e',   'rhs' : '\varepsilon'})
-- autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'f',   'rhs' : '\varphi'})
-- autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 've',  'rhs' : '\epsilon'})
-- autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'vf',  'rhs' : '\phi'})
-- autocmd FileType tex call vimtex#imaps#add_map({'lhs' : "'",   'rhs' : '\prime'})
-- autocmd("FileType", "tex", callback = function())
-- autocmd("FileType", "tex", callback = function())
-- autocmd("FileType", "tex", callback = function())
-- autocmd("FileType", "tex", callback = function())
-- autocmd("FileType", "tex", callback = function())

-- [xx deprecated by new autocomplete?]
-- autocmd FileType call ncm2#register_source({
--             \ 'name' : 'vimtex',
--             \ 'priority': 1,
--             \ 'subscope_enable': 1,
--             \ 'complete_length': 1,
--             \ 'scope': ['tex'],
--             \ 'matcher': {'name': 'combine',
--             \           'matchers': [
--             \               {'name': 'abbrfuzzy', 'key': 'menu'},
--             \               {'name': 'prefix', 'key': 'word'},
--             \           ]},
--             \ 'mark': 'tex',
--             \ 'word_pattern': '\w+',
--             \ 'complete_pattern': g:vimtex#re#ncm,
--             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
--             \ })
