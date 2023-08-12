-- TODO: xx move to ../lsp/init.lua ?
return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_installed   = "✓",
          package_uninstalled = "✗",
          package_pending     = "⟳",
        },
      },
    },
    -- build = ":MasonUpdate", -- TODO: xx from AstroVim
    config = require "plugins.config.mason",
  },
}
