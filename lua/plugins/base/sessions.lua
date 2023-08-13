-- Session management
return {

  -- Plugin to search for sessions in telescope; requires auto-session
  {
    "rmagatti/session-lens" ,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "rmagatti/auto-session",
    },
    opts = {
      theme      = nil,
      theme_conf = { winblend = nil },
      previewer  = false,
    },
    config = function(_, opts)
      require('session-lens').setup(opts)
    end
  },

  -- This saves the current session in the background, keeping track of open
  -- buffers, window arrangement, and more.  You can restore sessions when
  -- returning through the dashboard.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    },
  },

  -- Autosession doesn't work for me but it's required by session-lens
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_enabled = false,
        auto_session_root_dir = vim.fn.stdpath("data") .. "/session",
      }
    end,
  },

  -- Startify's splash is superceded by alpha but it's session management is nice
  {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_session_dir         = vim.fn.stdpath("data") .. "/session"
      vim.g.startify_bookmarks           = {'~/.local/share/nvim', '$projects'}
      vim.g.startify_session_persistence = true
      vim.g.startify_disable_at_vimenter = true
    end,
  },
}
