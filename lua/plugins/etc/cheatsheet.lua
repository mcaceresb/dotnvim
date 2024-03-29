-- bring up context-specific cheat sheet, including vim commands, with <leader>?
return {
  "sudormrfbin/cheatsheet.nvim",
  enabled = require("core.config").ui.cheatsheet.telescope,
  dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  },
  init = function()
    require("cheatsheet").setup({
      bundled_cheatsheets = true,
      bundled_plugin_cheatsheets = true,
      include_only_installed_plugins = true,
      -- Key mappings bound inside the telescope window
      telescope_mappings = {
        ['<CR>']   = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>']  = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>']  = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
      }
    })
  end,
}
