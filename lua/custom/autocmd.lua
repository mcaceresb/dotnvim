-- Auto-commands
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "lua", "tex", "r" },
  callback = function()
    vim.opt_local.tabstop     = 2
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.softtabstop = 2
  end,
})

autocmd("FileType", {
  pattern = { "tex", "text", "" },
  callback = function()
    vim.opt.colorcolumn = "0"
    -- vim.cmd "redraw"
  end,
})

-- weird bug https://github.com/neovim/neovim/issues/21856
autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart('', {detach=true})
  end,
})

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- TODO: keep?
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
