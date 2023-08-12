return {
  "goolord/alpha-nvim",
  dependencies = {
    -- TODO: xx Autosession has an easy API to loop through sessions _and_
    -- TODO: xx it's required by the session plugin for Telescope. However,
    -- TODO: xx it doesn't actually work for me. So I fall back to Startify
    {
      'rmagatti/auto-session',
      lazy = true,
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_enabled = false,
          auto_session_root_dir = vim.fn.stdpath("data") .. "/session",
          -- TODO: xx from defaults?
          -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }
      end,
    },
    {
      "mhinz/vim-startify",
      config = function()
        vim.g.startify_session_dir         = vim.fn.stdpath("data") .. "/session"
        vim.g.startify_bookmarks           = {'~/.local/share/nvim', '$projects'}
        vim.g.startify_session_persistence = true
        vim.g.startify_disable_at_vimenter = true
      end,
    },
  },
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("s", " " .. " Restore Session", ":Telescope session-lens search_session <CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl  = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl  = "AlphaFooter"
    dashboard.opts.layout[1].val      = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local sessions = {
      type = 'group',
      val = function ()
        local autosession   = require('auto-session')
        local sessions_root = autosession.get_root_dir()
        local sessions      = autosession.get_session_files()
        local val           = {
          {
            type = 'padding',
            val  = 1,
          },
          {
            type = 'text',
            val  = 'Recent sessions',
            opts = { position = 'center' }
          },
          {
            type = 'padding',
            val  = 1,
          },
        }
        table.sort(sessions, function (a, b)
          local a_time = vim.fn.getftime(sessions_root .. "/" .. a.path)
          local b_time = vim.fn.getftime(sessions_root .. "/" .. b.path)
          if a.path == "__LAST__" then
            return true
          elseif a.path ~= "__LAST__" then
            return false
          elseif a_time > b_time then
            return true
          elseif a_time < b_time then
            return false
          else
            return false
          end
        end)
        local sc = 1
        for i, session in ipairs(sessions) do
          if session.path == "__LAST__" then
              local cmd = [[:lua require("persistence").load({ last = true }) <cr>]]
              local lab = "[AUTOSAVED]"
              table.insert(val, dashboard.button("1", lab, cmd))
          elseif i <= 8 then
              local cmd = "<cmd>SLoad " .. session.path .. "<CR>"
              local lab = session.path
              sc = sc + 1
              table.insert(val, dashboard.button(tostring(sc), lab, cmd))
          end
          -- {opts = {align_shortcut = "left"}}
        end
        return val
      end,
    }

    table.insert(dashboard.opts.layout, sessions)
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
