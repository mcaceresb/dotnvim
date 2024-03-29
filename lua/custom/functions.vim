" ----------------------------------------------------------------------------
" Program: functions.vim
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Wed Jun  3 14:07:41 EDT 2015
" Updated: Tue Apr 26 12:51:47 EDT 2022
" Purpose: Mappings to functions or longer snippets [too lazy to port to lua]

" Function Mappings: {{{1
" -----------------------

" Custom clipboard
" let g:clipboard = {
"             \  'name': 'xsel',
"             \  'copy': {
"             \     '+': 'xsel --nodetach -i -b',
"             \     '*': 'xsel --nodetach -i -p',
"             \   },
"             \  'paste': {
"             \     '+': 'xsel -o -b',
"             \     '*': 'xsel -o -p',
"             \  },
"             \  'cache_enabled': 1,
"             \ }
" let g:loaded_clipboard_provider = 1

" Use par for hard-wrapping text (requires par)
if executable('par')
    set formatprg=par\ -w78req
endif

" Color scheme toggle
nnoremap z, :call ColorSchemeToggle()<CR>

" Precision rounding
nnoremap <leader>ro :call Rounding("%")<CR>
vnoremap <leader>ro :call Rounding("")<CR>
nnoremap <leader>rc :%s/\v(\d)((\d\d\d)+\d@!)@=/\1,/g<CR>
vnoremap <leader>rc :s/\v(\d)((\d\d\d)+\d@!)@=/\1,/g<CR>

" Preserve mappings (run a command and preserve history/cursor)
nmap <silent> <Leader>rs :call Preserve("%s/\\s\\+$//e")<CR>
nmap <silent> <Leader>r= :call Preserve("normal gg=G")<CR>

" Toggle OverLength match
nnoremap <leader><leader><CR> :call OverLengthToggle()<CR>
if &background == "dark"
    exec 'highlight OverLength      ctermbg=9 guibg=#C36C6C guifg=#FFFFFF gui=bold ctermfg=231 cterm=bold'
    exec 'highlight ExtraWhitespace ctermbg=9 guibg=#C36C6C'
else
    exec 'highlight OverLength      ctermbg=224 guibg=#FFD3D3'
    exec 'highlight ExtraWhitespace ctermbg=224 guibg=#FFD3D3'
endif

" Toggle conceal level
nnoremap <Leader>h :call ConcealLevelToggle()<CR>

" Highlight word under cursor
nnoremap z. :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()

" Show syntax highlighting groups for word under cursor
nmap <C-A-p> :call <SID>SynStack()<CR>

" Custom highlighting of code chunks
nnoremap <leader><F12> :call TextEnableCodeSnip('r', '\\begin{Scode}', '\\end{Scode}', 'SpecialComment')<CR>
nnoremap <leader><F11> :call TextEnableCodeSnip('r', '>>=', '@', 'SpecialComment')<CR>

" General Functions: {{{1
" -----------------------

"  ColorSchemeToggle: {{{2 Toggle light and dark colors with custom overrides

function! ColorSchemeToggle()
    if &background == "dark"
        set background=light
        colorscheme pencil
    else
        set background=dark
        colorscheme pencil
        exec 'highlight Normal guibg=NONE'
    endif
endfunction

" AutoHighlightToggle: Highlight word under cursor. n, N work as with * {{{2

" From http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=500
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=150
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" Conceal Mappings: Toggle conceal level {{{2

function! ConcealLevelToggle()
    if &conceallevel == 0
        setl conceallevel=2
        echo "Conceal blocks displayed as characters"
    else
        setl conceallevel=0
        echo "Conceal blocks displayed raw"
    endif
endfunction

" Make Short Log: Make short log from long log {{{2

command! MakeShortLog call MakeShortLog()
function! MakeShortLog() range
    let _s=@/
    let l = line(".")
    let c = col(".")

    execute 'normal! /History (Short)'
    execute 'normal! }jV}kc``````qaqmm'
    execute 'g/Event:.*\_.Date:.*$/normal! v/^Date$"Ay'
    execute 'normal! `m0"aPV}k'
    execute 'normal! :s/Date://ggv'
    execute 'normal! :g/^ /AdjustDategv'
    execute 'normal! :g/Event: /move+1gv'
    execute 'normal! :s/\vEvent: //ggvok'
    execute 'normal! :g/^\[/joingv'
    execute 'normal! :s/\] \*\*/] /ggv'
    execute 'normal! :s/\*\*\s*$//g'

    let @/=_s
    call cursor(l, c)
endfunction

command! AdjustDate call AdjustDate()
function! AdjustDate()
    let g:mline = split(getline('.'))

python << EOF
from dateutil import parser
import datetime
import vim

try:
    result = parser.parse(' '.join(vim.eval("g:mline")))
    vim.command("let g:result = '" + result.strftime("[%Y-%m-%d]") + "'")
except:
    vim.command("let g:result = '[Unknown DT]'")
EOF

    execute "normal! ddk"
    put =g:result
endfunction

" OverLength Toggle: Toggle OverLength highlighting {{{2

function! OverLengthToggle()
    if exists('g:myoverlength_toggle')
        2match OverLength /\%80v.\+/
        unlet g:myoverlength_toggle
    else
        2match OverLength //
        let g:myoverlength_toggle = 1
    endif
endfunction

" Preserve: Execute a command while preserving history and cursor position {{{2

command! -nargs=* Preserve call Preserve("<args>")
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Rounding: Precision rounding of floats {{{2

function! Rounding(selection) range
    let g:rounding = 1 * input('Round to how many decimals? ')
    if g:rounding < 0
        echo "Negative rounding not implemented at this time"
        return
    endif
    if a:selection == ""
        let g:selection = a:firstline . "," . a:lastline
    else
        let g:selection = a:selection
    endif
    execute g:selection . "s/\\d*\\.\\d\\+/" .
                \ "\\=printf('%." . g:rounding . "f', str2float(submatch(0)))/g"
endfunction

" Stab: Set tabstop, softtabstop and shiftwidth to the same value {{{2

" From http://vimcasts.org/episodes/tabs-and-spaces/
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

" SynStack: Show syntax highlighting groups for word under cursor {{{2

" From http://vimcasts.org/episodes/creating-colorschemes-for-vim/
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" From http://vimcasts.org/episodes/creating-colorschemes-for-vim/
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" TextEnableCodeSnip: Custom region highlighting {{{2

" From http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
function! TextEnableCodeSnip(filetype, start, end, textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \matchgroup='.a:textSnipHl.'
                \start="'.a:start.'" end="'.a:end.'"
                \contains=@'.group
endfunction
hi link Snip SpecialComment

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}

