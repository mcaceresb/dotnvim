local map = vim.keymap.set

return function()
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
