-- NOTE: Need to keep ui and mappings for compatibility with ui and base46;
-- NOTE: don't fiddle with names/options too mcuh

local M = {}
-- local flavor = "nvchad"
local flavor = "custom"

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add              = {},
  hl_override         = {},
  changed_themes      = {},
  theme_toggle        = { "onedark", "one_light" },
  theme               = "onedark",
  nvchad_load         = flavor == "nvchad",
  transparency        = flavor == "custom",
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  -- these aren't compiled by default, ex: "alpha", "notify"
  -- extended_integrations = { "alpha", "notify" },
  extended_integrations = {},

  -- cmp themeing
  cmp = {
    icons            = true,
    lspkind_text     = true,
    style            = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color     = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
    item_flavor      = "default", -- default / lazy
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style   = "default",
    -- overriden_modules = nil,
    overriden_modules = function(modules)
      if flavor == "custom" then
        modules[1]  = (function() return "" end)()
        modules[2]  = (function() return "" end)()
        modules[3]  = (function() return "" end)()
        modules[4]  = ""
        modules[5]  = (function() return "" end)()
        modules[6]  = ""
        modules[7]  = (function() return "" end)()
        modules[8]  = (function() return "" end)()
        modules[9]  = (function() return "" end)()
        modules[10] = (function() return "" end)()
      end
    end
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers      = false,
    enabled           = false,
    lazyload          = true,
    overriden_modules = nil,
  },

  -- splash screen on startup
  nvdash = {
    load_on_startup = false,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    -- display, shortcut, command
    buttons = {
      {"  New file",        "n", "ene <BAR> startinsert"},
      {"  Recent files",    "r", "Telescope oldfiles"},
      {"  Find file",       "f", "Telescope find_files"},
      {"  Find text",       "g", "Telescope live_grep"},
      {"  Config",          "c", "e $MYVIMRC"},
      {"  Restore Session", "s", "Telescope session-lens search_session"},
      {"󰒲  Lazy",            "l", "Lazy"},
      {"  Quit",            "q", "qa"},
    },
  },

  cheatsheet = { theme = "grid", telescope = false }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent   = true, -- silences 'no signature help available' message from appearing
    },
  },
}

-- NOTE: I define mappings the regular way and not through NvChad's dictionary,
-- NOTE: but I keep a copy of NvChad's defaults as a fallback
M.mappings = require "mappings.nvchad"

return M
