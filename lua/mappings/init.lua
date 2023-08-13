local map = vim.keymap.set

-------------------------------------- old map ------------------------------------------

-- Update timestamp (depends on `now` snippet)
-- nmap <A-S> mzgg/Updated:<CR>f:wD:r !date +'\%a \%b \%d \%H:\%M:\%S \%Z \%Y'<CR>kJ`z:w<CR>

-------------------------------------- mapping ------------------------------------------

-- TODO: xx how often do you use ; to find next character? maybe map : to ;?
-- map("n", ";", ":", { desc = "Enter command mode", nowait = true })

map({"n", "v"}, "<C-k>", "5k", { desc = "Jump down 5 lines" })
map({"n", "v"}, "<C-j>", "5j", { desc = "Jump up 5 lines"   })

map("", "<C-h>", "gT", { desc = "Previous tab" })
map("", "<C-l>", "gt", { desc = "Next tab"     })

map("", "<A-l>", ":bnext<CR>",     { desc = "Next buffer"     })
map("", "<A-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- TODO: xx swap lines; superceded by mini.nvim -> mini.move?
map("n", "<A-j>", "<cmd>m+<CR>==",  { desc = "Move line one down" })
map("n", "<A-k>", "<cmd>m-2<CR>==", { desc = "Move line one up"   })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection one line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection one line up"   })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move current line one line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move current line one line up"   })

map("n", "gf", "<C-w>gf",  { desc = "Open file in new tab"          })
map("n", "gF", "gf",       { desc = "Open file in current buffer"   })
map("n", "gs", "<C-w>f",   { desc = "Open file in horizontal split" })
map("n", "gS", "<C-w>vgf", { desc = "Open file in vertical split"   })

map("n", "<A-s>", ":w<CR>",        { desc = "Save file" })
map("i", "<A-s>", "<Esc>:w<CR>a",  { desc = "Save file" })
map("n", "<A-q>", ":bd<CR>",       { desc = "Quit file" })
map("i", "<A-q>", "<Esc>:bd<CR>a", { desc = "Quit file" })

map("v", ">", "><CR>gv", { desc = "Keep hl when indenting selection"   })
map("v", "<", "<<CR>gv", { desc = "Keep hl when unindenting selection" })

-- map("n", "<S-Space>", "a<C-x>s<C-n><CR>", { desc = "Correct spelling under cursor" })
-- map("n", "<S-Space>", "a<C-x>s<C-n>", { desc = "Correct spelling under cursor" })

map("n", "<leader>-", ":on<CR>", { desc = "Keep only this buffer" })

map("n", "<leader>.", "<C-w>c", { desc = "Close window but buffer open" })

-- TODO: xx this messes up command mode because w is suddenly mapped ):
-- map("c", "w!!", "w !sudo tee > /dev/null %", { desc = "Sudo tee (use suda if this fails)" })

map("n", "z0", "zMzvzz", { desc = "Close all folds except current one" })

map("n", "<F12>", "@q", { desc = "Get quicker macro replay" })

map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move visual (if wrapped) line down" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move visual (if wrapped) line up"   })

map("v", "<leader>c", '"+y', { desc = "Copy from clipboard"  })
map("v", "<leader>x", '"+d', { desc = "Paste from clipboard" })
map("v", "<leader>v", '"+p', { desc = "Cut from clipboard"   })

map("n", "<leader>v", '"+p',   { desc = "Paste from clipboard" })
map("n", "<leader>V", '"+P',   { desc = "Paste from clipboard" })
map("n", "<leader>c", '"+yiW', { desc = "Copy from clipboard"  })
map("n", "<leader>C", '"+yy',  { desc = "Copy from clipboard"  })
map("n", "<leader>x", '"+diW', { desc = "Cut from clipboard"   })
map("n", "<leader>X", '"+dd',  { desc = "Cut from clipboard"   })

map("i", "<leader><leader>v", '<Esc>"+pa',   { desc = "Paste from clipboard" })
map("i", "<leader><leader>V", '<Esc>"+Pa',   { desc = "Paste from clipboard" })
map("i", "<leader><leader>c", '<Esc>"+yiWa', { desc = "Copy from clipboard"  })
map("i", "<leader><leader>C", '<Esc>"+yya',  { desc = "Copy from clipboard"  })
map("i", "<leader><leader>x", '<Esc>"+diWa', { desc = "Cut from clipboard"   })
map("i", "<leader><leader>X", '<Esc>"+dda',  { desc = "Cut from clipboard"   })

map("n", "<A-a>", "GVgg",       { desc = "Select all" })
map("n", "<A-c>", "mmggyG`mzz", { desc = "Copy all"   })

map("n", "gpt", "yypv$r-",  { desc = "Markdown style title" })
map("n", "gpc", "yypwv$r-", { desc = "Markdown style title (copy first word)" })

map("i", "<A-z>", "<Esc>ua", { desc = "Undo" })
map("i", "<C-z>", "<Esc>ua", { desc = "Undo" })
-- map("i", "<A-u>", "<C-g>u<C-u>", { desc = "[xx why break undo before deleting word/line?]" })
-- map("i", "<A-w>", "<C-g>u<C-w>", { desc = "[xx why break undo before deleting word/line?]" })
-- map("i", "<C-u>", "<C-g>u<C-u>", { desc = "[xx why break undo before deleting word/line?]" })
-- map("i", "<C-w>", "<C-g>u<C-w>", { desc = "[xx why break undo before deleting word/line?]" })

map("n", "<F4>", "i<C-R>=expand('%:p:h')<CR><ESC>", { desc = "Insert current file's directory" })
map("i", "<F4>", "<C-R>=expand('%:p:h')<CR>",       { desc = "Insert current file's directory" })

map("n", "<leader>el", ":tabedit $HOME/code/latex-preamble<CR>", { desc = "Tab open LaTeX folder" })
map("n", "<leader>ev", ":tabedit $MYVIMRC<CR>", { desc = "Tab open vimrc" })
map("n", "<leader>rv", ":source  $MYVIMRC<CR>", { desc = "Source vimrc" })

map("", "<A-Insert>", ":tabnew<CR>:Startify<CR>", { desc = "Open new tab" })
map("", "<A-Delete>", ":tabclose<CR>",            { desc = "Close current tab" })

map("n", "<leader>s", ":set spell!<CR>", { desc = "Toggle spell" })
map("n", "<leader><leader>l", ":set list!<CR>", { desc = "Toggle list chars", remap = true})
map("n", "<leader><CR>", ":noh<CR>cxc", { desc = "Clear hl, including exchange", remap = true, silent = true })

map("v", "<leader>a", "gugv:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>", { desc = "Capitalize first letters" })
map("v", "<C-r>",     '"hy:%s/<C-r>h//gc<left><left><left>',     { desc = "Search and replace" })

map("", "<A-left>", "<C-w><", { desc = "Move right split bound left" })
map("", "<A-right>","<C-w>>", { desc = "Move right split bound right" })
map("", "<A-up>",   "<C-w>-", { desc = "Move bottom split bound up"  })
map("", "<A-down>", "<C-w>+", { desc = "Move bottom split bound down" })

map("n", "<LocalLeader>b", "<cmd> enew <CR>", { desc = "New buffer" })
map("t", "<Esc>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- Navigate within insert mode
map("i", "<C-b>", "<ESC>^i",    { desc = "Beginning of line"  })
map("i", "<C-e>", "<End>",      { desc = "End of line"        })
map("i", "<C-h>", "<C-Left>",   { desc = "Move word left"     })
map("i", "<C-l>", "<C-Right>",  { desc = "Move word right"    })
-- map("i", "<C-j>", "<Down>",     { desc = "Move down"          })
-- map("i", "<C-k>", "<Up>",       { desc = "Move up"            })
