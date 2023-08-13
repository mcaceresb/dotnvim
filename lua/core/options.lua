local opt = vim.opt

opt.cmdheight   = 1              -- Height of command line
opt.showmode    = false          -- No VISUAL, INSERT, REPLACE message (will show in statusline)
opt.autochdir   = true           -- Change directory to file in buffer
opt.clipboard   = "unnamedplus"  -- Map global keyboard to +
opt.lazyredraw  = false          -- Do or don't redraw screen while executing macros (false required for noice.nvim)
opt.showtabline = 1              -- only show tabline with 2 or mote tabs
-- opt.laststatus  = 2           -- main status line on last buffer
opt.laststatus  = 3              -- single global status line

opt.cursorline  = false          -- Highlight current cursor line (fun but slow)
opt.ignorecase  = true           -- Ignore case of letters in pattern search
opt.smartcase   = true           -- Override ignorecase when upper letter is typed
opt.mouse       = "a"            -- Mouse support everywhere ("a" = all)
opt.winaltkeys  = "no"           -- Allow using alt keys for vim mappings
opt.breakindent = true           -- Soft wrap respecting visual indentation
opt.infercase   = true           -- Smart case in insert-mode completion
opt.showbreak   = "  "           -- Prepend to start of soft-wrapped line
opt.completeopt = "noinsert,menuone,noselect,preview"
opt.listchars   = { tab = "» ", eol = "¬"}
opt.shortmess:append "I"

-- opt.signcolumn    = "yes"    -- [xx possibly important for misc stuff]
-- opt.timeoutlen    = 400      -- [xx possibly important for misc stuff]
opt.splitbelow    = true        -- Open splits on bottom half of current buffer
opt.splitright    = true        -- vsplit splits right
opt.termguicolors = true        -- More colors in the BUI
opt.undofile      = true        -- Persistent undo
vim.o.undodir     = vim.fn.stdpath("data") .. "/undo"

-- Indenting
opt.expandtab   = true          -- Insert spaces for tabs, like a sane person
opt.tabstop     = 4             -- Spaces a tab counts for, visually
opt.shiftwidth  = 4             -- Ibid, but to auto-indent
opt.softtabstop = 4             -- Ibid, but while editing (e.g. <Tab>, <BS>)
opt.autoindent  = true          -- Copy last line's indent
opt.smartindent = true          -- Smart auto-indenting

-- Placeholder characters
-- opt.fillchars = {
--     eob       = " ",
--     horiz     = '─',
--     horizup   = '┴',
--     horizdown = '┬',
--     vert      = '│',
--     vertleft  = '┤',
--     vertright = '├',
--     verthoriz = '┼',
--     fold      = '·',
--     foldopen  = '-',
--     foldclose = '+',
--     foldsep   = '│',
--     diff      = '-',
--     msgsep    = ' ',
--     lastline  = ' ',
-- }

-- Numbers
opt.number      = true          -- Show line numbers in left margin
opt.numberwidth = 2             -- Minimum width of number column
opt.ruler       = true          -- Show line and column numbers in status line

-- Swap files
opt.updatetime = 250            -- interval for writing swap file to disk, also used by gitsigns
opt.swapfile   = false          -- Don't use swap files

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
