return {
  'preservim/nerdtree',
  lazy = false,
  dependencies = {
    'ryanoasis/vim-devicons',
    'Xuyuanp/nerdtree-git-plugin'
  },
  keys = {
    { mode = "n", "<F10>", "<cmd>NERDTreeToggle<CR>", desc = "Toggle NERD tree" },
  },
  config = function()
    -- vim.g.NERDTreePath      = true
    -- vim.g.NERDTreeDirNode   = true
    -- vim.g.NERDTreeFileNode  = true
    -- vim.g.NERDTreeBookmark  = false
    vim.g.webdevicons_enable_nerdtree                        = true
    vim.g.webdevicons_enable_airline_tabline                 = true
    vim.g.webdevicons_enable_airline_statusline              = true
    vim.g.webdevicons_enable_ctrlp                           = true
    vim.g.WebDevIconsUnicodeDecorateFileNodes                = true
    vim.g.WebDevIconsUnicodeDecorateFolderNodes              = true
    vim.g.DevIconsEnableFoldersOpenClose                     = true
    vim.g.webdevicons_conceal_nerdtree_brackets              = true
    vim.g.WebDevIconsNerdTreeAfterGlyphPadding               = ' '
    vim.g.WebDevIconsNerdTreeGitPluginForceVAlign            = false
    vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
    vim.g.DevIconsDefaultFolderOpenSymbol                    = ''
    vim.cmd([[
      let NERDTreeHijackNetrw = 1
      let NERDTreeMapHelp     = 1
      let NERDTreeMinimalUI   = 1
      let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "→",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
    ]])
  end,
}
