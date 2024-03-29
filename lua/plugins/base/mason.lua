return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = function()
    return require "plugins.configs.mason"
  end,
  build = ":MasonUpdate",
  config = function(_, opts)
    if vim.g.nvchad_load then
      dofile(vim.g.base46_cache .. "mason")
    end
    require("mason").setup(opts)
    -- custom nvchad cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})
    vim.g.mason_binaries_list = opts.ensure_installed
  end,
}
