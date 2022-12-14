" ----------------------------------------------------------------------------
" Program: mappings.vim
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Sat Jun 27 12:10:47 EDT 2015
" Updated: Tue Apr 26 12:50:05 EDT 2022
" Purpose: Personal vim mappings

" Recommended: Very useful mappings {{{1

" Move visual lines
nnoremap <C-k> 5k
nnoremap <C-j> 5j
vnoremap <C-j> 5j
vnoremap <C-k> 5k

" Navigate tabs/buffers
noremap <C-h> gT
noremap <C-l> gt
noremap <A-l> :bnext<CR>
noremap <A-h> :bprevious<CR>

" Swap lines
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Open split and open in new tab
nnoremap gf <C-w>gf
nnoremap gF gf
nnoremap gs <C-w>f

"Map s and q to save file and quit buffer
nnoremap <A-s> :w<CR>
inoremap <A-s> <Esc>:w<CR>a
nnoremap <A-q> :bd<CR>
inoremap <A-q> <Esc>:bd<CR>a

" Keep highlighting when indenting
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Quickly correct spelling
" nnoremap <S-Space> a<C-x>s " Use if you revert menuopt settings
nnoremap <S-Space> a<C-x>s<C-n><CR>
nnoremap m<Space>  mma<C-x>s<ESC>`m

" Map Y to yank until the end of the line
nnoremap Y y$

" Keep only this buffer
nnoremap <leader>- :on<CR>

" Close window but buffer open
nnoremap <leader>. <C-w>c

" Sudo tee (use suda if this fails)
cnoremap w!! w !sudo tee > /dev/null %

" Useful: Favorite semi-custom mappings {{{1

" Close all folds except current one
nnoremap z0 zMzvzz

" Get quicker macro replay
nnoremap <F12> @q

" Move visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Copy/paste from clipboard
vnoremap <leader>c "+y
vnoremap <leader>x "+d
vnoremap <leader>v "+p

nnoremap <leader>v "+p
nnoremap <leader>V "+P
nnoremap <leader>c "+yiW
nnoremap <leader>C "+yy
nnoremap <leader>x "+diW
nnoremap <leader>X "+dd

inoremap <leader><leader>v <Esc>"+pa
inoremap <leader><leader>V <Esc>"+Pa
inoremap <leader><leader>c <Esc>"+yiWa
inoremap <leader><leader>C <Esc>"+yya
inoremap <leader><leader>x <Esc>"+diWa
inoremap <leader><leader>X <Esc>"+dda

" Select/copy all
nnoremap <A-a> GVgg
nnoremap <A-c> mmggyG`mzz

" Markdown title
nnoremap gpt yypv$r-
nnoremap gpc yypwv$r-

" More undo
inoremap <A-z> <Esc>ua
inoremap <A-u> <C-g>u<C-u>
inoremap <A-w> <C-g>u<C-w>
inoremap <C-z> <Esc>ua
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Insert current file's directory
nnoremap <F4> i<C-R>=expand('%:p:h')<CR><ESC>
inoremap <F4> <C-R>=expand('%:p:h')<CR>

" Efficiently open and source vimrc
nnoremap <leader>el :tabedit $HOME/code/latex-preamble<CR>
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Close and open tabs
noremap <A-Insert> :tabnew<CR>:Startify<CR>
noremap <A-Delete> :tabclose<CR>

" Toggle Spell, highlight, smart indent, list
nnoremap <leader>s :set spell!<CR>
nmap <silent> <leader><CR> :noh<CR>cxc
nmap <leader><leader>l :set list!<CR>
set pastetoggle=<F6>

" Vim quickly enlarge or reduce font
nnoremap <C-Up> :let &guifont=substitute(&guifont, '\d\+', '\=(submatch(0)+1)', '')<CR> :echo &guifont<CR>
nnoremap <C-Down> :let &guifont=substitute(&guifont, '\d\+', '\=(submatch(0)-1)', '')<CR> :echo &guifont<CR>

" Questionable: Potentially useful, but maybe not {{{1

" Capitalize first letters
vnoremap <leader>a gugv:s/\v<(.)(\w*)/\u\1\L\2/g<CR>

" Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Thesaurus look-up
nnoremap <C-Space> hEa<C-x><C-t>

" Resize split windows
noremap <A-left> <C-w><
noremap <A-right> <C-w>>
noremap <A-up> <C-w>-
noremap <A-down> <C-w>+

" Update timestamp (depends on `now` snippet)
nmap <A-S> mzgg/Updated:<CR>f:wD:r !date +'\%a \%b \%d \%H:\%M:\%S \%Z \%Y'<CR>kJ`z:w<CR>

" Remap escape in neovim terminal mode to actual escape
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
