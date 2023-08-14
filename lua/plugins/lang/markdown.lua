-- stata support
return {
  'iamcco/markdown-preview.nvim',
  ft = { 'markdown' },
  config = function()
    vim.fn["mkdp#util#install"]()
    -- TODO: Is this actually working?
    vim.g.markdown_fenced_languages = {
      'bash=sh',
      'sh',
      'javascript',
      'python',
      'sql',
      'r',
      'SAS=sas',
      'sas',
      'Stata=stata',
      'stata'
    }
    vim.g.vim_markdown_fenced_languages = vim.g.markdown_fenced_languages
  end,
}
