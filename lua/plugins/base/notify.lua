-- pretty notifications
return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>of",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    background_colour = "#000000",
  },
  init = function()
    vim.notify = require("notify")
  end,
}
