-- easymotion replacement; hop around visual text with motions and labels
return {
  'phaazon/hop.nvim',
  branch = 'v2',
  init = function()
    require "mappings.hop"()
    require('hop').setup({
      case_insensitive = true
    })
  end
}
