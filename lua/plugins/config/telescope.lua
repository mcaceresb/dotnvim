local M = {}
local map = vim.keymap.set

M.mappings = function ()
  map("n", "<LocalLeader>/", "<cmd> Telescope live_grep <CR>",                     { desc = "Live grep"       })
  map("n", "<LocalLeader>:", "<cmd> Telescope command_history <CR>",               { desc = "Command History" })
  map("n", "<LocalLeader>,", "<cmd> Telescope buffers show_all_buffers=true <CR>", { desc = "Switch buffer"   })
  map("n", "<LocalLeader>f", "<cmd> Telescope find_files <CR>",                    { desc = "Find files"      })

  -- find
  map("n", "<leader>;b", "<cmd> Telescope buffers <CR>",                   { desc = "Find buffers"           })
  -- map("n", "<leader>;c", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })
  map("n", "<leader>;o", "<cmd> Telescope oldfiles <CR>",                  { desc = "Find oldfiles"          })

  -- search
  map("n", "<leader>;a", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
  map("n", "<leader>;h", "<cmd> Telescope help_tags <CR>",         { desc = "Help page"               })
  map("n", "<leader>;;", "<cmd> Telescope builtin <CR>",           { desc = "Builtins"                })
  map("n", "<leader>;s", "<cmd> Telescope spell_suggest <CR>",     { desc = "Suggest spellings"       })
  map("n", "<leader>;j", "<cmd> Telescope jumplist <CR>",          { desc = "Jumplist"                })
  map("n", "<leader>;m", "<cmd> Telescope marks <CR>",             { desc = "telescope bookmarks"     })
  map("n", '<leader>;"', "<cmd>Telescope registers<cr>",           { desc = "Registers"               })
  -- map("n", "<leader>;a", "<cmd>Telescope autocommands<cr>",        { desc = "Auto Commands"           })
  map("n", "<leader>;c", "<cmd>Telescope commands<cr>",            { desc = "Commands"                })
  map("n", "<leader>;d", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics"    })
  map("n", "<leader>;D", "<cmd>Telescope diagnostics<cr>",         { desc = "Workspace diagnostics"   })
  map("n", "<leader>;H", "<cmd>Telescope highlights<cr>",          { desc = "Search Highlight Groups" })
  map("n", "<leader>;k", "<cmd>Telescope keymaps<cr>",             { desc = "Key Maps"                })
  map("n", "<leader>;M", "<cmd>Telescope man_pages<cr>",           { desc = "Man Pages"               })
  map("n", "<leader>;o", "<cmd>Telescope vim_options<cr>",         { desc = "Options"                 })
  map("n", "<leader>;R", "<cmd>Telescope resume<cr>",              { desc = "Resume"                  })

  -- git
  map("n", "<LocalLeader>gc", "<cmd> Telescope git_commits  <CR>", { desc = "Git commits"  })
  map("n", "<LocalLeader>gs", "<cmd> Telescope git_status   <CR>", { desc = "Git status"   })
  map("n", "<LocalLeader>gf", "<cmd> Telescope git_files    <CR>", { desc = "Git files"    })
  map("n", "<LocalLeader>gb", "<cmd> Telescope git_branches <CR>", { desc = "Git branches" })

  -- pick a hidden term
  map("n", "<LocalLeader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })
end

M.options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    style              = "borderless",
    prompt_prefix      = "   ",
    selection_caret    = " ",
    entry_prefix       = "  ",
    initial_mode       = "insert",
    selection_strategy = "reset",
    sorting_strategy   = "ascending",
    layout_strategy    = "horizontal",
    layout_config      = {
      horizontal = {
        prompt_position = "top",
        preview_width   = 0.55,
        results_width   = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width          = 0.87,
      height         = 0.80,
      preview_cutoff = 120,
    },
    file_sorter          = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter       = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display         = { "truncate" },
    winblend             = 0,
    border               = {},
    borderchars          = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons       = true,
    set_env              = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer       = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer       = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer     = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<c-t>"] = function(...)
          return require("trouble.providers.telescope").open_with_trouble(...)
        end,
        ["<a-t>"] = function(...)
          return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end,
        ["<a-i>"] = function()
          local action_state = require("telescope.actions.state")
          local line = action_state.get_current_line()
          Util.telescope("find_files", { no_ignore = true, default_text = line })()
        end,
        ["<a-h>"] = function()
          local action_state = require("telescope.actions.state")
          local line = action_state.get_current_line()
          Util.telescope("find_files", { hidden = true, default_text = line })()
        end,
        ["<C-Down>"] = function(...)
          return require("telescope.actions").cycle_history_next(...)
        end,
        ["<C-Up>"] = function(...)
          return require("telescope.actions").cycle_history_prev(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
        ["<C-b>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
      },
      n = {
        ["q"] = function(...)
          return require("telescope.actions").close(...)
        end,
      },
    },
  },
  -- TODO: xx from NvChad
  -- extensions_list = { "themes", "terms" },
  extensions_list = { "session-lens", "notify" },
}

return M
