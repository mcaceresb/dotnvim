return {
  "vim-airline/vim-airline",
  enabled = false,
  config = function()
    vim.g.airline_symbols = {}
    vim.g.airline_powerline_fonts    = 1
    vim.g.airline_symbols.linenr     = '¶'
    vim.g.airline_symbols.notexists  = '∄'
    vim.g.airline_symbols.paste      = '∥'
    vim.g.airline_symbols.readonly   = ''
    vim.g.airline_symbols.whitespace = 'Ξ'
    vim.g.airline_symbols.maxlinenr  = ''
    vim.g.airline_symbols.branch     = '⎇ '
    -- vim.g.airline_left_sep           = ''
    -- vim.g.airline_right_sep          = ''
    -- vim.g.airline_symbols.spell      = 'Ꞩ'
  end,
  -- init = function()
  --   vim.cmd('source /home/mauricio/.local/share/nvim/plugged/colors-pencil/autoload/airline/themes/pencil.vim')
  -- end,
}
