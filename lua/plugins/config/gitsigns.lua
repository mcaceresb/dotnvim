local map   = vim.keymap.set
local merge = function(...) vim.tbl_deep_extend("force", ...) end
local M     = {}

M.mappings = function(opts)
  -- Navigation through hunks
  map(
    "n", 
    "]c", 
    function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    merge({ desc = "Jump to next hunk", expr = true }, opts or {}))

  map(
    "n", 
    "[c", 
    function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    merge({ desc = "Jump to prev hunk", expr = true }, opts or {}))

  -- Actions
  -- map(
  --   "n",
  --   "<LocalLeader>rh",
  --   function()
  --     require("gitsigns").reset_hunk()
  --   end,
  --   merge({ desc = "Reset hunk" }, opts or {}))

  -- map(
  --   "n",
  --   "<LocalLeader>td",
  --   function()
  --     require("gitsigns").toggle_deleted()
  --   end,
  --   merge({ desc = "Toggle deleted" }, opts or {}))

  map(
    "n",
    "<LocalLeader>ghp",
    function()
      require("gitsigns").preview_hunk()
    end,
    merge({ desc = "Preview hunk" }, opts or {}))

  map(
    "n",
    "<LocalLeader>ghb",
    function()
      package.loaded.gitsigns.blame_line()
    end,
    merge({ desc = "Blame line" }, opts or {}))

    map(
      "n",
      "<leader>ghd",
      function()
        package.loaded.gitsigns.diffthis()
      end,
      merge({ desc = "Diff This" }, opts or {}))

    map(
      "n",
      "<leader>ghD",
      function()
        package.loaded.gitsigns.diffthis("~")
      end,
      merge({ desc = "Diff This ~" }, opts or {}))
end

return {
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "‾" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "│" },
  },
  worktrees = vim.g.git_worktrees,
  on_attach = function(bufnr)
    M.mappings({ buffer = bufnr })
  end,
}
