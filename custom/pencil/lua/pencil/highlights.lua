-- Author: This is de-facto a fork of mcookly/pencil-colors.nvim

local c = require("pencil").config

local M = {}

local function set_highlight(hl_group)
   for hl_name, hl_settings in pairs(hl_group) do
      vim.api.nvim_set_hl(0, hl_name, hl_settings)
   end
end

local function load_highlights(p)
   local hl = { lang = {}, plugin = {} }

   hl.common = {
      Normal  = { bg = p.bg, fg = p.norm },
      Cursor  = { bg = p.blue, fg = p.norm },
      Comment = { fg = p.comment, italic = true },
      -- Constant
      Constant  = { fg   = p.cyan },
      String    = { link = "Constant" },
      Character = { link = "Constant" },
      Number    = { link = "Constant" },
      Boolean   = { link = "Constant" },
      Float     = { link = "Constant" },
      -- Identifier
      Identifier = { fg   = p.dark_blue },
      Function   = { link = "Identifier" },
      -- Statement
      Statement  = { fg   = p.green, bold = c.options.bolder },
      Conditonal = { link = "Statement" },
      Repeat     = { link = "Statement" },
      Label      = { link = "Statement" },
      Operator   = { link = "Statement" },
      Keyword    = { link = "Statement" },
      Exception  = { link = "Statement" },
      -- Preproc
      PreProc   = { fg   = p.bluez, bold = c.options.bolder },
      Include   = { link = "PreProc" },
      Define    = { link = "PreProc" },
      Macro     = { link = "PreProc" },
      PreCondit = { link = "PreProc" },
      -- Type
      Type         = { fg   = p.purple },
      StorageClass = { link = "Type" },
      Structure    = { link = "Type" },
      Typedef      = { link = "Type" },
      -- Special
      Special        = { fg   = p.pink },
      SpecialChar    = { link = "Special" },
      Tag            = { link = "Special" },
      Delimiter      = { link = "Special" },
      SpecialComment = { link = "Special" },
      Debug          = { link = "Special" },
      -- Underlined
      Underlined = { fg = p.norm, underline = true },
      Ignore     = { fg = p.bg },
      Error      = { fg = p.actual_white, bg = p.pink, bold = true, italic = true },
      Todo       = { fg = p.actual_white, bg = p.pink, bold = true, italic = true },
      TodoBgFIX  = { link = "Error" },
      TodoFgFIX  = { fg = p.pink, bold = true, italic = true },
      TodoBgTODO = { link = "Todo" },
      TodoFgTODO = { fg = p.pink, bold = true, italic = true },
   }

   hl.ui_chrome = {
      SpecialKey   = { fg   = p.light_green },
      NonText      = { fg   = p.bg_subtle },
      Directory    = { fg   = p.dark_blue },
      ErrorMsg     = { fg   = p.pink },
      IncSearch    = { bg   = p.yellow, fg = p.light_black },
      Search       = { bg   = p.bg_subtle },
      MoreMsg      = { fg   = p.medium_gray, bold = true },
      ModeMsg      = { link = "MoreMsg" },
      LineNr       = { fg   = p.grayz },
      CursorLineNr = { fg   = p.blue, bg = p.bg_very_subtle },
      Question     = { fg   = p.red },
      StatusLine   = { bg   = p.bg_very_subtle },
      Conceal      = { fg   = p.norm },
      StatusLineNC = { bg   = p.bg_very_subtle, fg = p.medium_gray },
      VertSplit    = { fg   = p.grayz },
      Title        = { fg   = p.dark_blue },
      Visual       = { bg   = p.visual },
      VisualNOS    = { bg   = p.bg_subtle },
      WarningMsg   = { fg   = p.red },
      WildMenu     = { fg   = p.bg, bg = p.norm },
      Folded       = { fg   = p.medium_gray },
      FoldColumn   = { fg   = p.bg_subtle },
      DiffAdd      = { fg   = p.green },
      DiffAdded    = { fg   = p.green },
      DiffDelete   = { fg   = p.red },
      DiffRemoved  = { bg   = p.red },
      DiffChange   = { fg   = p.dark_yellow },
      DiffChanged  = { fg   = p.dark_yellow },
      DiffText     = { fg   = p.dark_blue },
      SignColumn   = { fg   = p.light_green },
      -- Spelling
      SpellBad   = vim.tbl_extend("error", p.sp_un, { sp = p.red,         fg = p.red }),
      SpellCap   = vim.tbl_extend("error", p.sp_un, { sp = p.light_green, fg = p.light_green }),
      SpellRare  = vim.tbl_extend("error", p.sp_un, { sp = p.pink,        fg = p.pink }),
      SpellLocal = vim.tbl_extend("error", p.sp_un, { sp = p.dark_green,  fg = p.dark_green }),
      -- Menu
      Pmenu        = { fg = p.norm, bg = p.bg_subtle },
      PmenuSel     = { fg = p.norm, bg = p.dark_blue },
      PmenuSbar    = { fg = p.norm, bg = p.bg_subtle },
      PmenuThumb   = { fg = p.norm, bg = p.bg_subtle },
      TabLine      = { fg = p.norm, bg = p.bg_very_subtle },
      TabLineSel   = { fg = p.blue, bg = p.bg_subtle, bold  = true },
      TabLineFill  = { fg = p.norm, bg = p.bg_very_subtle },
      CursorColumn = { bg = p.bg_very_subtle },
      CursorLine   = { bg = p.bg_very_subtle },
      ColorColumn  = { bg = p.bg_subtle },
      -- Misc
      MatchParen = { bg = p.bg_subtle, fg = p.norm },
      qfLineNr   = { fg = p.medium_gray },
      MiniIndentscopeSymbol = { fg = p.light_blue, bold = true },
      VirtColumn = { fg = p.bg_subtle },
      DiagnosticInfo  = { bold = true },
      DiagnosticError = { bold = true },
      -- NotifyBackground = { fg = p.norm },
   }

   hl.lang.markdown = {
      markdownBlockquote        = { fg = p.norm },
      markdownBold              = { fg = p.norm, bold = true },
      markdownBoldItalic        = { fg = p.norm, italic = true, bold = true },
      markdownEscape            = { fg = p.norm },
      markdownH1                = { fg = p.head_a, italic = true, bold = true },
      markdownH2                = { fg = p.head_a, bold   = true },
      markdownH3                = { fg = p.head_a, italic = true },
      markdownH4                = { fg = p.head_a, italic = true },
      markdownH5                = { fg = p.head_a },
      markdownH6                = { fg = p.head_a },
      markdownHeadingDelimiter  = { fg = p.norm },
      markdownHeadingRule       = { fg = p.norm },
      markdownId                = { fg = p.medium_gray },
      markdownIdDeclaration     = { fg = p.norm_subtle },
      markdownItalic            = { fg = p.norm, italic = true },
      markdownLinkDelimiter     = { fg = p.medium_gray },
      markdownLinkText          = { fg = p.norm },
      markdownLinkTextDelimiter = { fg = p.medium_gray },
      markdownListMarker        = { fg = p.norm },
      markdownOrderedListMarker = { fg = p.norm },
      markdownRule              = { fg = p.norm },
      markdownUrl               = { fg = p.medium_gray, underline = true },
      markdownUrlDelimiter      = { fg = p.medium_gray },
      markdownUrlTitle          = { fg = p.norm },
      markdownUrlTitleDelimiter = { fg = p.medium_gray },
      markdownCode              = { fg = p.norm, bg = p.code_bg },
      -- xx markdownCode        = { fg = "#10A778", bg = p.code_bg },
      markdownCodeDelimiter     = { fg = p.norm, bg = p.code_bg },
   }
   
   -- XML is included
   hl.lang.html      = {
      htmlTag        = { link   = "Special" },
      htmlEndTag     = { link   = "htmlTag" },
      htmlTagName    = { link   = "Keyword" },
      htmlTagN       = { link   = "Keyword" },
      htmlH1         = { fg     = p.head_a, bold = true, italic = true },
      htmlH2         = { fg     = p.head_a, bold = true },
      htmlH3         = { fg     = p.head_a, italic = true },
      htmlH4         = { fg     = p.head_a, italic = true },
      htmlH5         = { fg     = p.head_a },
      htmlH6         = { fg     = p.head_a },
      htmlLink       = { fg     = p.blue, underline = true },
      htmlItalic     = { italic = true },
      htmlBold       = { bold   = true },
      htmlBoldItalic = { bold   = true, italic = true },
      xmlTag         = { link   = "htmlTag" },
      xmlEndTag      = { link   = "xmlTag" },
      xmlTagName     = { link   = "htmlTagName" },
   }

   hl.lang.stata = {
      stataLocal  = { fg = "#7AB4DB", bold = true },
      stataGlobal = { fg = "#BE646C", bold = true },
   }

   hl.lang.sas = {
      sasComment        = { fg = p.greenz, italic  = true },
      sasFunction       = { fg = "#3A3A3A", italic = true, bold = true },
      sasMacroFunction  = { fg = "#5F5FFF", italic = true, bold = true },
      sasMacroVar       = { fg = "#5F5FFF", bold   = true   },
      -- xx sasMacroVar = { link = "sasFunction" },
      sasStep           = { fg = "#3C4C72", bold   = true   },
      sasProcName       = { fg = "#3C4C72", bold   = true   },
      sasString         = { fg = "#AF33AF", bold   = false  },
      sasNumber         = { fg = "#2E8B57", bold   = true   },
      sasStatementKwd   = { fg = "#5F5FFF", bold   = false  },
      sasProcSQLKwd     = { fg = "#5F5FFF", bold   = false  },
   }

   hl.lang.tex = {
      texPartArgTitle     = { link = 'Normal' },
      texEnvArgName       = { link = 'Normal' },
      texRefArg           = { link = 'String' },
      texArg              = { link = 'String' },
      texCmdStyle         = { link = 'Type'   },
      texCmdStyleBold     = { link = 'Type'   },
      texCmdStyleItal     = { link = 'Type'   },
      texCmdStyleBoldItal = { link = 'Type'   },
      texCmdStyleItalBold = { link = 'Type'   },
   }

   return hl
end

function M.setup(palette)
   local hl = load_highlights(palette)

   set_highlight(hl.common)
   set_highlight(hl.ui_chrome)

   for lang_name, lang_enabled in pairs(c.lang) do
      if lang_enabled then
         set_highlight(hl.lang[lang_name])
      end
   end
end

return M
