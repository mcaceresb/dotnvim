" ----------------------------------------------------------------------------
" Program: vimrc-lean
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Thu Oct 20 09:13:28 EDT 2016
" Updated: Tue Apr 26 12:53:35 EDT 2022
" Purpose: Custom color overrides

colorscheme pencil
exec 'highlight Normal guibg=NONE'

" Colors: Some hard-coded color modifications I like {{{1

" Change grayness of comments of the fly (e.g. :Setgray 42)
command! -nargs=1 Setgray hi Comment gui=italic cterm=italic guifg=grey<args>
highlight Comment gui=italic cterm=italic guifg=#A6A6A6
if &background != "dark"
    Setgray 48
" else
"     Setgray 59
endif

" Display style for misspelled words (set by colors-pencil)
" NOTE(mauricio): This is currently set by colors-pencil
" hi clear SpellBad
" hi SpellBad ctermfg=red cterm=bold gui=undercurl guisp=red

" Highlight extra white space and lines that are too long
if &background == "dark"
    exec 'highlight OverLength      ctermbg=9 guibg=#C36C6C guifg=#FFFFFF gui=bold ctermfg=231 cterm=bold'
    exec 'highlight ExtraWhitespace ctermbg=9 guibg=#C36C6C'
else
    exec 'highlight OverLength      ctermbg=224 guibg=#FFD3D3'
    exec 'highlight ExtraWhitespace ctermbg=224 guibg=#FFD3D3'
endif
match ExtraWhitespace /\s\+$/
2match OverLength /\%80v.\+/

" File Type highlighting
exec 'highlight link texPartArgTitle     Normal'
exec 'highlight link texEnvArgName       Normal'
exec 'highlight link texRefArg           String'
exec 'highlight link texArg              String'
exec 'highlight link texCmdStyle         Type'
exec 'highlight link texCmdStyleBold     Type'
exec 'highlight link texCmdStyleItal     Type'
exec 'highlight link texCmdStyleBoldItal Type'
exec 'highlight link texCmdStyleItalBold Type'

exec 'highlight link sasMacroVar sasFunction'
exec 'highlight markdownCode guifg=#10A778'
exec 'highlight stataLocal   guifg=#7AB4DB gui=bold cterm=bold ctermfg=110'
exec 'highlight stataGlobal  guifg=#BE646C gui=bold cterm=bold ctermfg=131'
exec 'highlight link juliaStringVarsPla Normal'

exec 'highlight sasMacroVar      guifg=#5f5fff gui=bold   cterm=bold   ctermfg=63'
exec 'highlight sasStep          guifg=#3C4C72 gui=bold   cterm=bold   ctermfg=67'
exec 'highlight sasProcName      guifg=#3C4C72 gui=bold   cterm=bold   ctermfg=67'
exec 'highlight sasString        guifg=#af33af gui=none   cterm=none   ctermfg=54'
exec 'highlight sasNumber        guifg=#2e8b57 gui=bold   cterm=bold   ctermfg=29'
exec 'highlight sasStatementKwd  guifg=#5f5fff gui=none   cterm=none   ctermfg=63'
exec 'highlight sasProcSQLKwd    guifg=#5f5fff gui=none   cterm=none   ctermfg=63'

if &background == "dark"
    exec 'highlight sasComment   guifg=#99cc99 gui=italic cterm=italic ctermfg=28'
else
    exec 'highlight sasComment   guifg=#007700 gui=italic cterm=italic ctermfg=28'
endif

exec 'highlight sasFunction      guifg=#3a3a3a gui=bold,italic cterm=bold,italic ctermfg=237'
" exec 'highlight sasMacroFunction guifg=#3a3a3a gui=bold,italic cterm=bold,italic ctermfg=237'
" exec 'highlight sasMacro         guifg=#3a3a3a gui=bold,italic cterm=bold,italic ctermfg=237'

" exec 'highlight sasFunction      guifg=#5f5fff gui=none cterm=none ctermfg=63'
exec 'highlight sasMacroFunction guifg=#5f5fff gui=bold,italic cterm=bold,italic ctermfg=63'
" exec 'highlight sasMacro         guifg=#5f5fff gui=none        cterm=none        ctermfg=63'

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}

