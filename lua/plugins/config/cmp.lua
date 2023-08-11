local cmp = require "cmp"
local snip_status_ok, luasnip = pcall(require, "luasnip")
local lspkind_status_ok, lspkind = pcall(require, "lspkind")
local cmp_ui = {
  icons            = true,
  lspkind_text     = true,
  style            = "default", -- default/flat_light/flat_dark/atom/atom_colored
  border_color     = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
  selected_item_bg = "colored", -- colored / simple
}
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },
  -- TODO: xx integrate lspkind ? what is this ?

  -- TODO: xx from NvChad
  -- format = function(_, item)
  --   local icons = require "nvchad.icons.lspkind"
  --   local icon = (cmp_ui.icons and icons[item.kind]) or ""
  --   if cmp_style == "atom" or cmp_style == "atom_colored" then
  --     icon = " " .. icon .. " "
  --     item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
  --     item.kind = icon
  --   else
  --     icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
  --     item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
  --   end
  --
  --   return item
  -- end,

  -- TODO: xx from LazyVim
  format = function(_, item)
    local icons = require("config.icons")
    if icons[item.kind] then
      item.kind = icons[item.kind] .. item.kind
    end
    return item
  end,

  -- TODO: xx from AstroVim
  -- format = lspkind_status_ok and lspkind.cmp_format(utils.plugin_opts "lspkind.nvim") or lazyformat,
}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  -- TODO: xx from NvChad
  -- completion = {
  --   completeopt = "menu,menuone",
  -- },

  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel", -- TODO: xx from NvChad
      -- scrollbar    = true, -- TODO: xx from NvChad
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      scrollbar    = false,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },

  -- TODO: xx from AstroVim
  -- local border_opts = {
  --   border = "rounded",
  --   winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
  -- }
  -- window = {
  --   completion    = cmp.config.window.bordered(border_opts),
  --   documentation = cmp.config.window.bordered(border_opts),
  -- },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  duplicates = {
    nvim_lsp    = 1,
    luasnip     = 1,
    cmp_tabnine = 1,
    buffer      = 1,
    path        = 1,
  },

  preselect  = cmp.PreselectMode.None,
  formatting = formatting_style,

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  -- TODO: xx NvChad
  -- mapping = {
  --   ["<C-p>"] = cmp.mapping.select_prev_item(),
  --   ["<C-n>"] = cmp.mapping.select_next_item(),
  --   ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --   ["<C-Space>"] = cmp.mapping.complete(),
  --   ["<C-e>"] = cmp.mapping.close(),
  --   ["<CR>"] = cmp.mapping.confirm {
  --     behavior = cmp.ConfirmBehavior.Insert,
  --     select = true,
  --   },
  --   ["<Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     elseif require("luasnip").expand_or_jumpable() then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
  --     else
  --       fallback()
  --     end
  --   end, {
  --     "i",
  --     "s",
  --   }),
  --   ["<S-Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     elseif require("luasnip").jumpable(-1) then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
  --     else
  --       fallback()
  --     end
  --   end, {
  --     "i",
  --     "s",
  --   }),
  -- },

  mapping = {
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-k>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
      end
    end, { "i", "s" }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4),  { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ["<CR>"]  = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.mapping.confirm { select = false }
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sorting = {
    comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        -- cmp.config.compare.scopes,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
    },
  },

  sources = cmp.config.sources {
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip",  priority = 750 },
    { name = "buffer",   priority = 500 },
    { name = "path",     priority = 250 },
    -- {
    --   name = 'spell',
    --   option = {
    --     keep_all_entries  = false,
    --     enable_in_context = function()
    --       return true
    --     end,
    --   },
    -- },
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "CmpBorder"
end

return options
