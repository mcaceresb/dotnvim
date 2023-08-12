-- Functions and longer snippets
local new_cmd = vim.api.nvim_create_user_command

new_cmd("Wrap", function()
    vim.opt.wrap      = true
    vim.opt.linebreak = true
    vim.opt.list      = true
end, {})

new_cmd("Nowrap", function()
    vim.opt.wrap      = false
    vim.opt.linebreak = false
    vim.opt.list      = false
end, {})
