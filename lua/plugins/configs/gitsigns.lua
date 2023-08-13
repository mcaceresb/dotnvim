return {
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "-" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "│" },
  },
  worktrees = vim.g.git_worktrees,
  on_attach = function(bufnr)
    require("mappings.gitsigns").buffer({ buffer = bufnr })
  end,
}
