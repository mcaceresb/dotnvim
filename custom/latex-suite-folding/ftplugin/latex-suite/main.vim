"     " LaTeX filetype
"     "	  Language: LaTeX (ft=tex)
"     "	Maintainer: Srinath Avadhanula
"     "		   URL:

"     " line continuation used here.
let s:save_cpo = &cpo
set cpo&vim

"     " avoiding re-inclusion {{{
"     " the avoiding re-inclusion statement is not provided here because the files
"     " which call this file should in the normal course of events handle the
"     " re-inclusion stuff.

"     " we definitely dont want to run through the entire file each and every time.
"     " only once to define the functions. for successive latex files, just set up
"     " the folding and mappings and quit.
if exists('s:doneFunctionDefinitions') && !exists('b:forceRedoLocalTex')
call s:SetTeXOptions()
finish
endif

let s:doneFunctionDefinitions = 1
"
"     " get the place where this plugin resides for setting cpt and dict options.
"     " these lines need to be outside the function.
let s:path = expand('<sfile>:p:h')
" set up personal defaults.
" runtime ftplugin/tex/texrc
"     " set up global defaults.
exe "so ".fnameescape(s:path.'/texrc')

" }}}

"     nmap <silent> <script> <plug> i
"     imap <silent> <script> <C-o><plug> <Nop>

" ==============================================================================
" mappings
" ==============================================================================
" {{{
" calculate the mapleader character.
let s:ml = '<Leader>'

if !exists('s:doneMappings')
	let s:doneMappings = 1
	" See imaps.vim
end

" }}}

" ==============================================================================
" Helper functions for debugging
" ==============================================================================
" Tex_Debug: appends the argument into s:debugString {{{
" Description:
"
" Do not want a memory leak! Set this to zero so that latex-suite always
" starts out in a non-debugging mode.
if !exists('g:Tex_Debug')
	let g:Tex_Debug = 0
endif
function! Tex_Debug(str, ...)
	if !g:Tex_Debug
		return
	endif
	if a:0 > 0
		let pattern = a:1
	else
		let pattern = ''
	endif
	if !exists('s:debugString_'.pattern)
		let s:debugString_{pattern} = ''
	endif
	let s:debugString_{pattern} = s:debugString_{pattern}.a:str."\n"

	let s:debugString_ = (exists('s:debugString_') ? s:debugString_ : '')
		\ . pattern.' : '.a:str."\n"

	if Tex_GetVarValue('Tex_DebugLog') != ''
		exec 'redir! >> '.Tex_GetVarValue('Tex_DebugLog')
		silent! echo pattern.' : '.a:str
		redir END
	endif
endfunction " }}}

" ==============================================================================
" Uncategorized helper functions
" ==============================================================================
" Tex_MakeMap: creates a mapping from lhs to rhs if rhs is not already mapped {{{
" Description:
function! Tex_MakeMap(lhs, rhs, mode, extraargs)
	if !hasmapto(a:rhs, a:mode)
		exec a:mode.'map '.a:extraargs.' '.a:lhs.' '.a:rhs
	endif
endfunction " }}}
" Tex_GetPos: gets position of cursor {{{
function! Tex_GetPos()
	if exists('*getpos')
		return getpos('.')
	else
		return line('.').' | normal! '.virtcol('.').'|'
	endif
endfunction " }}}
" Tex_SetPos: sets position of cursor {{{
function! Tex_SetPos(pos)
	if exists('*setpos')
		call setpos('.', a:pos)
	else
		exec a:pos
	endif
endfunction " }}}

"     " ==============================================================================
"     " Smart key-mappings
"     " ==============================================================================

" source all the relevant files.
exe 'source '.fnameescape(s:path.'/item.vim')
exe 'source '.fnameescape(s:path.'/folding.vim')

" ==============================================================================
" Finally set up the folding, options, mappings and quit.
" ==============================================================================
" SetTeXOptions: sets options/mappings for this file. {{{
function! <SID>SetTeXOptions()
	" Avoid reinclusion.
	if exists('b:doneSetTeXOptions')
		return
	endif
	let b:doneSetTeXOptions = 1
endfunction

augroup LatexSuite
	au LatexSuite User LatexSuiteFileType
		\ call Tex_Debug('main.vim: Catching LatexSuiteFileType event', 'main') |
		\ call <SID>SetTeXOptions()
augroup END

" }}}

" ==============================================================================
" Settings for taglist.vim plugin
" ==============================================================================
" Sets Tlist_Ctags_Cmd for taglist.vim and regexps for ctags {{{
if exists("g:Tex_TaglistSupport") && g:Tex_TaglistSupport == 1
	if !exists("g:tlist_tex_settings")
		let g:tlist_tex_settings = 'tex;s:section;c:chapter;l:label;r:ref'
	endif

	if exists("Tlist_Ctags_Cmd")
		let s:tex_ctags = Tlist_Ctags_Cmd
	else
		let s:tex_ctags = 'ctags' " Configurable in texrc?
	endif

	if exists("g:Tex_InternalTagsDefinitions") && g:Tex_InternalTagsDefinitions == 1
		let Tlist_Ctags_Cmd = s:tex_ctags ." --langdef=tex --langmap=tex:.tex.ltx.latex"
		\.' --regex-tex="/\\\\begin{abstract}/Abstract/s,abstract/"'
		\.' --regex-tex="/\\\\part[ \t]*\*?\{[ \t]*([^}]*)\}/\1/s,part/"'
		\.' --regex-tex="/\\\\chapter[ \t]*\*?\{[ \t]*([^}]*)\}/\1/s,chapter/"'
		\.' --regex-tex="/\\\\section[ \t]*\*?\{[ \t]*([^}]*)\}/\1/s,section/"'
		\.' --regex-tex="/\\\\subsection[ \t]*\*?\{[ \t]*([^}]*)\}/+ \1/s,subsection/"'
		\.' --regex-tex="/\\\\subsubsection[ \t]*\*?\{[ \t]*([^}]*)\}/+  \1/s,subsubsection/"'
		\.' --regex-tex="/\\\\paragraph[ \t]*\*?\{[ \t]*([^}]*)\}/+   \1/s,paragraph/"'
		\.' --regex-tex="/\\\\subparagraph[ \t]*\*?\{[ \t]*([^}]*)\}/+    \1/s,subparagraph/"'
		\.' --regex-tex="/\\\\begin{thebibliography}/BIBLIOGRAPHY/s,thebibliography/"'
		\.' --regex-tex="/\\\\tableofcontents/TABLE OF CONTENTS/s,tableofcontents/"'
		\.' --regex-tex="/\\\\frontmatter/FRONTMATTER/s,frontmatter/"'
		\.' --regex-tex="/\\\\mainmatter/MAINMATTER/s,mainmatter/"'
		\.' --regex-tex="/\\\\backmatter/BACKMATTER/s,backmatter/"'
		\.' --regex-tex="/\\\\appendix/APPENDIX/s,appendix/"'
		\.' --regex-tex="/\\\\label[ \t]*\*?\{[ \t]*([^}]*)\}/\1/l,label/"'
		\.' --regex-tex="/\\\\ref[ \t]*\*?\{[ \t]*([^}]*)\}/\1/r,ref/"'
	endif
endif

" }}}

" ==============================================================================
" These functions are used to immitate certain operating system type functions
" (like reading the contents of a file), which are not available in vim. For
" example, in Vim, its not possible to read the contents of a file without
" opening a buffer on it, which means that over time, lots of buffers can open
" up needlessly.
"
" If python is available (and allowed), then these functions utilize python
" library functions without making calls to external programs.
" ==============================================================================

let &cpo = s:save_cpo

" Define the functions in python if available.
if !has('python') || !g:Tex_UsePython
	finish
endif

" vim:fdm=marker:ff=unix:noet:ts=4:sw=4:nowrap
