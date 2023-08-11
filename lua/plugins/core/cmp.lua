local spellmap = [[wbea<cmd>
  lua require("cmp").complete({
    config = {
      sources = {
        {
          name = 'spell',
          option = { keep_all_entries  = true}
        }
      }
    }
  })<CR>]]

return {
  {
    "L3MON4D3/LuaSnip",
    build = vim.fn.has "win32" == 0
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      or nil,
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      store_selection_keys = "<C-x>" ,
      -- TODO: from NvChad
      -- history = true,
      -- updateevents = "TextChanged,TextChangedI",
    },
    config = require "plugins.config.luasnip",
  },
  {
    "hrsh7th/nvim-cmp",
    -- cmp sources plugins
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
    },
    keys = {
      {
        mode = "n",
        "<S-Space>",
        spellmap:gsub("%s+", " "),
        desc = "Correct spelling under cursor",
        remap = false,
      }
    },
    event = "InsertEnter",
    opts = function()
      return require "plugins.config.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
}
