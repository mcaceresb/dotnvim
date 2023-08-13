local M = {}

M.echo = function(str)
  vim.cmd "redraw"
  vim.notify(str, vim.log.levels.INFO, { title = "Installing plugins" })
end

M.shell_call = function(args)
  local output = vim.fn.system(args)
  local outmsg = vim.v.shell_error .. "\n" .. output
  assert(vim.v.shell_error == 0, "External call failed with error code: " .. outmsg)
end

M.install = function(lazy_path)

  local base46_path = vim.fn.stdpath("data") .. "/lazy/base46"
  local base46_repo = "https://github.com/NvChad/base46"
  local lazy_repo   = "https://github.com/folke/lazy.nvim.git"

  ------------- base46 ---------------
  M.echo "  Compiling base46 theme to bytecode ..."
  M.shell_call { "git", "clone", "--depth", "1", "-b", "v2.0", base46_repo, base46_path }
  vim.opt.rtp:prepend(base46_path)
  require("base46").compile()

  --------- plugins via lazy.nvim ---------------
  M.echo "  Installing lazy.nvim & plugins ..."
  M.shell_call { "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path }
  vim.opt.rtp:prepend(lazy_path)
  require("plugins")

  -- TODO: Maybe start up alpha here
  M.echo "✔︎  Done!"
end

return M
