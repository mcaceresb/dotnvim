-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  "folke/which-key.nvim",
  -- TODO: xx keys is in NvChad but not LazyVim; folke made LazyVim so I'd go with this
  -- keys = { "<leader>", "<LocalLeader>", '"', "'", "`", "c", "v", "g" },
  event = "VeryLazy",
  opts  = {
    plugins  = {
      spelling = true,
      registers = false,
    },
    defaults = {
      mode = { "n", "v" },
      ["g"]             = { name = "+goto" },
      ["gz"]            = { name = "+surround" },
      ["]"]             = { name = "+next" },
      ["["]             = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"]     = { name = "+buffer" },
      ["<leader>c"]     = { name = "+code" },
      ["<leader>f"]     = { name = "+file/find" },
      ["<leader>g"]     = { name = "+git" },
      ["<leader>gh"]    = { name = "+hunks" },
      ["<leader>q"]     = { name = "+quit/session" },
      ["<leader>s"]     = { name = "+search" },
      ["<leader>u"]     = { name = "+ui" },
      ["<leader>w"]     = { name = "+windows" },
      ["<leader>x"]     = { name = "+diagnostics/quickfix" },
    },
  },
  init = function()
    require("plugins.config.whichkey").mappings()
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
