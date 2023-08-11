" ----------------------------------------------------------------------------
" Program: autocmd.vim
" Author:  Mauricio Caceres Bravo <mauricio.caceres.bravo@gmail.com>
" Created: Thu Jun  4 03:16:32 EDT 2015
" Updated: Tue Apr 26 12:52:38 EDT 2022
" Purpose: Vim autocmd settings

" FileType Customization: Some file-type-specific settings {{{1

" Custom spacing, folding, etc. for various file types
" autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
autocmd FileType stata setlocal comments=b:*,fb:-,s1:/*,mb:*,ex:*/,://,:*
autocmd FileType stata setlocal commentstring=*%s
autocmd FileType sas   setlocal comments=s0:/*,m0:*,ex0:*/
autocmd FileType tex   setlocal tabstop=2
autocmd FileType tex   setlocal shiftwidth=2
autocmd FileType tex   setlocal softtabstop=2
" autocmd FileType tex call VimtexNewMathZone('E', 'align*', 1)

autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'e',   'rhs' : '\varepsilon'})
autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'f',   'rhs' : '\varphi'})
autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 've',  'rhs' : '\epsilon'})
autocmd FileType tex call vimtex#imaps#add_map({'lhs' : 'vf',  'rhs' : '\phi'})
autocmd FileType tex call vimtex#imaps#add_map({'lhs' : "'",   'rhs' : '\prime'})
" au User Ncm2Plugin call ncm2#register_source({
autocmd FileType call ncm2#register_source({
            \ 'name' : 'vimtex',
            \ 'priority': 1,
            \ 'subscope_enable': 1,
            \ 'complete_length': 1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'combine',
            \           'matchers': [
            \               {'name': 'abbrfuzzy', 'key': 'menu'},
            \               {'name': 'prefix', 'key': 'word'},
            \           ]},
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })


" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
