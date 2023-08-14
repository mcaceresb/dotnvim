-- latex support
return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function ()
      require "mappings.tex"()
    end,
    config = function()
      vim.g.vimtex_compiler_method         = 'latexrun'
      vim.g.vimtex_fold_enabled            = false
      vim.g.vimtex_imaps_leader            = ','
      vim.g.vimtex_view_general_viewer     = 'okular'
      vim.g.vimtex_complete_recursive_bib  = true
      vim.g.vimtex_quickfix_ignore_filters = { 'mathpple' }
      -- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
      -- vim.g.vimtex_complete_enabled = true
      -- vim.g.vimtex_view_automatic   = true
      -- Tex_FoldedEnvironments = ",frame,flashcard,tacomment,theorem,proof,definition"
    end,
  },
  -- {
  --   dir = vim.fn.stdpath("config") .. "/custom/latex-fenced-languages",
  --   ft = { "tex" },
  -- },
  -- {
  --   dir = vim.fn.stdpath("config") .. "/custom/latex-suite-folding",
  --   ft = { "tex" },
  -- },
}
