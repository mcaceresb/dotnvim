-- highlight current indentation level (works best with blankline)
return {
  "echasnovski/mini.indentscope",
  -- version = false, -- wait till new 0.7.0 release to put it back on semver
  dependencies = { "lukas-reineke/indent-blankline.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function()
    local mini = require('mini.indentscope')
    local opts = {
      symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = true },
      draw = { animation = mini.gen_animation.none() } ,
    }
    mini.setup(opts)
  end,
}
