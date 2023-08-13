return {
  "nvim-neo-tree/neo-tree.nvim",
  branch  = "v3.x",
  lazy    = false,
  cmd     = "Neotree",
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
    },
    window = {
      mappings = {
        ["u"] = "navigate_up",
        ["f"] = "fuzzy_finder",
        ["/"] = "none",
        ["U"] = "close_node",
      },
    },
  },
  init = function()
    require "mappings.neotree"()
  end,
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
}
