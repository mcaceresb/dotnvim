return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  init = function()
    local config = require("plugins.config.nvimtree")
    local on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- default mappings
      api.config.mappings.default_on_attach(bufnr)
      -- custom mappings
      vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help,           opts('Help'))
    end
    config.mappings()
    require("nvim-tree").setup({config.options, on_attach=on_attach})
  end,
}
