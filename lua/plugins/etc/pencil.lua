-- preferred color scheme
return {
  dir = vim.fn.stdpath("config") .. "/custom/pencil",
  lazy = false,
  enabled = not vim.g.nvchad_load,
  config = function()
    require("pencil").setup({
      options = {
        higher_contrast_ui = false,
        neutral_code_bg    = false,
        neutral_headings   = false,
        terminal_italics   = false,
        spell_undercurl    = true,
        gutter_color       = false,
        bolder             = true,
      }
    })
    require("pencil").load()
  end,
}
