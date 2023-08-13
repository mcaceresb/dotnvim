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
  "hrsh7th/nvim-cmp",
  -- cmp sources plugins
  dependencies = {
    "L3MON4D3/LuaSnip",
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
    return require "plugins.configs.cmp"
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
}
