local M   = {}
local map = vim.keymap.set

M.mappings = function ()
  map("n", "<F10>",          "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
  map("n", "<LocalLeader>e", "<cmd> NvimTreeFocus <CR>",  { desc = "Focus nvimtree"  })
end

M.options = {
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw  = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  hijack_unnamed_buffer_when_opening = false,
  update_focused_file = {
    enable      = true,
    update_root = false,
  },
  view = {
    side  = "left",
    width = 100,
    adaptive_size = false,
    preserve_window_proportions = true,
  },
  -- git = {
  --   enable = false,
  --   ignore = true,
  -- },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label      = false,
    highlight_git          = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false,
    },
    icons = {
      show = {
        file         = true,
        folder       = true,
        folder_arrow = true,
        git          = true,
      },
      glyphs = {
        -- default = "󰈚",
        -- symlink = "",
        -- folder = {
        --   default      = "",
        --   empty        = "",
        --   empty_open   = "",
        --   open         = "",
        --   symlink      = "",
        --   symlink_open = "",
        --   arrow_open   = "",
        --   arrow_closed = "",
        -- },
        git = {
          unstaged  = "✗",
          staged    = "✓",
          unmerged  = "",
          renamed   = "➜",
          untracked = "★",
          deleted   = "",
          ignored   = "◌",
        },
      },
    },
  },
}

return M
