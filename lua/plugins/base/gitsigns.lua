-- git signs for versioned files
return {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
  ft = { "gitcommit", "diff" },
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
          vim.schedule(function()
            require("lazy").load { plugins = { "gitsigns.nvim" } }
          end)
        end
      end,
    })
    require("mappings.gitsigns").global()
  end,
  opts = function()
    return require "plugins.configs.gitsigns"
  end,
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
