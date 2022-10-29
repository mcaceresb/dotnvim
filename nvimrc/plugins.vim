" ----------------------------------------------------------------------------
" Program: plugins.vim
" Author:  Mauricio Caceres Bravo <mauricio.caceres.bravo@gmail.com>
" Created: Fri Apr 28 21:47:50 EDT 2017
" Updated: Tue Apr 26 12:47:38 EDT 2022
" Purpose: Lean version of the plugins I use

" Plugins: Initialize plugins {{{1

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin()
endif

" Favorites: Almost 'core' {{{2

Plug 'tpope/vim-fugitive',             {'as' : 'fugitive'}
Plug 'tpope/vim-speeddating',          {'as' : 'speeddating'}
Plug 'tpope/vim-unimpaired',           {'as' : 'unimpaired'}
Plug 'tpope/vim-repeat',               {'as' : 'repeat'}
Plug 'tpope/vim-surround',             {'as' : 'surround'}
Plug 'tpope/vim-abolish',              {'as' : 'abolish'}
Plug 'airblade/vim-gitgutter',         {'as' : 'gitgutter'}
Plug 'easymotion/vim-easymotion',      {'as' : 'easymotion'}
Plug 'lambdalisue/suda.vim',           {'as' : 'suda'}
Plug 'mbbill/undotree',                {'as' : 'undotree'}
Plug 'mhinz/vim-startify',             {'as' : 'startify'}
Plug 'salsifis/vim-transpose',         {'as' : 'transpose'}
Plug 'scrooloose/nerdtree',            {'as' : 'nerdtree'}
Plug 'Xuyuanp/nerdtree-git-plugin',    {'as' : 'nerdtree-git'}
Plug 'tommcdo/vim-exchange',           {'as' : 'exchange'}
Plug 'tomtom/tcomment_vim',            {'as' : 'tcomment'}
Plug 'SirVer/ultisnips',               {'as' : 'ultisnips'}
Plug 'honza/vim-snippets',             {'as' : 'snippets'}

" Redundant: Some redundancy but keep all sets for now {{{2

Plug 'godlygeek/tabular',                      {'as' : 'tabular'}
Plug 'junegunn/vim-easy-align',                {'as' : 'easyalign'}
Plug 'ctrlpvim/ctrlp.vim',                     {'as' : 'ctrlp'}
Plug 'nvim-telescope/telescope.nvim',          {'as' : 'telescope'}
Plug 'LinArcX/telescope-command-palette.nvim', {'as' : 'telescope-palette'}

" Cosmetics: My preferred aesthetics {{{2

if has('nvim')
    Plug 'ryanoasis/vim-devicons', {'as' : 'nerdtree-devicons'}
endif

Plug 'vim-airline/vim-airline',        {'as' : 'airline'}
Plug 'vim-airline/vim-airline-themes', {'as' : 'airline-themes'}
Plug 'reedes/vim-colors-pencil',       {'as' : 'colors-pencil'}

" NCM2: Plugins for NCM2 completion {{{2

if has('nvim')
    Plug 'roxma/nvim-yarp',     {'as': 'yarp'}
    Plug 'ncm2/ncm2',           {'as': 'ncm2'}
    Plug 'ncm2/ncm2-bufword',   {'as': 'ncm2-bufword'}
    Plug 'ncm2/ncm2-path',      {'as': 'ncm2-path'}
    Plug 'ncm2/ncm2-jedi',      {'as': 'ncm2-jedi'}
    Plug 'ncm2/ncm2-ultisnips', {'as': 'ncm2/ncm2-ultisnips'}
endif

" Recommended: Frequently used {{{2

Plug 'mhinz/neovim-remote',             {'as' : 'nvr'}
Plug 'glacambre/firenvim',              {'as' : 'firenvim'}
Plug 'kassio/neoterm',                  {'as' : 'neoterm'}
Plug 'vimwiki/vimwiki',                 {'as' : 'vimwiki'}
Plug 'Yggdroot/indentLine',             {'as' : 'indentline'}
Plug 'Raimondi/delimitMate',            {'as' : 'delimate'}
Plug 'haya14busa/incsearch.vim',        {'as' : 'incsearch'}
Plug 'haya14busa/incsearch-fuzzy.vim',  {'as' : 'incsearch-fuzzy'}
Plug 'jalvesaq/vimcmdline',             {'as' : 'cmdline'}
Plug 'w0rp/ale',                        {'as' : 'ale'}
Plug 'nvim-treesitter/nvim-treesitter', {'as' : 'treesitter', 'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim',           {'as' : 'plenary'}
Plug 'mzlogin/vim-markdown-toc',        {'as' : 'markdown-toc'}

" Language Support: Language-specific {{{2

Plug 'JuliaLang/julia-vim',          {'as' : 'julia'}
Plug 'google/yapf',                  {'rtp': 'plugins/vim',  'for': 'python'}
Plug 'vim-scripts/SAS-Syntax',       {'as' : 'sas',          'for' : 'sas'}
Plug 'jalvesaq/Nvim-R',              {'as' : 'rplugin',      'for' : 'r'}
Plug 'lervag/vimtex',                {'as' : 'vimtex',       'for' : 'tex'}

let g:bundle_path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/bundle/'
Plug g:bundle_path . 'latex-fenced-languages', {'for' : 'tex'}
Plug g:bundle_path . 'latex-suite-folding',    {'for' : 'tex'}
Plug g:bundle_path . 'stata-jump-program',     {'for' : 'stata'}

call plug#end()

" Plugin Configuration: Mess with plugin options {{{1

" Airline: Awesome status indicator {{{2

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts    = 1
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.notexists  = '∄'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.readonly   = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.branch     = '⎇ '

" This is theoretically useful, but I don't know how to have it hide
let g:airline#extensions#whitespace#enabled = 0
" let g:airline_theme = 'pencil'
" let g:airline_left_sep  = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.spell = 'Ꞩ'

" Colors: Interesting Color scheme. Needs more bold {{{2

let g:pencil_spell_undercurl    = 1
let g:pencil_gutter_color       = 1
let g:pencil_neutral_code_bg    = 1
let g:pencil_neutral_headings   = 1
let g:pencil_higher_contrast_ui = 0
let g:pencil_bolder             = 1
let g:pencil_terminal_italics   = 1

let g:one_allow_italics         = 1
let g:enable_bold_font          = 1
let g:enable_italic_font        = 1

" switch to 1 to allow cool transparency
let g:hybrid_transparent_background = 0
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 0,
  \       'allow_bold': 1,
  \       'allow_italics': 1
  \     }
  \   }
  \ }

" let g:PaperColor_Theme_Options = {
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins' : 1
"   \     },
"   \     'cpp': {
"   \       'highlight_standard_library': 1
"   \     },
"   \     'c': {
"   \       'highlight_builtins' : 1
"   \     }
"   \   }
"   \ }

" EasyAlign: {{{2

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
            \   '/': {
            \     'pattern':         '\/\/\+',
            \     'delimiter_align': 'l',
            \   },
            \   '\': {
            \     'pattern':         '\\\\\+',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment']
            \   },
            \   '>': {
            \     'pattern':       '-\?>\|>>\|=>',
            \     'left_margin':   1,
            \     'right_margin':  1,
            \     'stick_to_left': 0,
            \     'ignore_groups': ['!Comment']
            \   },
            \   '<': {
            \     'pattern':       '-\?<\|<<\|<=',
            \     'left_margin':   1,
            \     'right_margin':  1,
            \     'stick_to_left': 0,
            \     'ignore_groups': ['!Comment']
            \   },
            \   ';': {
            \     'pattern':       ';',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 1,
            \     'ignore_groups': ['!Comment']
            \   },
            \  '%': {
            \     'pattern':         '%\+',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment']
            \   },
            \ }

" EasyMotion: Vim Motions on Steroids: {{{2

map <space> <Plug>(easymotion-prefix)
map <space><space> <Plug>(easymotion-s2)
" map <space>/ <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" IncSearch: Improved incremental search highlighting {{{2

map z/  <Plug>(incsearch-fuzzyspell-/)
map z?  <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" IndentLine: Indentation markers {{{2

let g:indentLine_myToggle = 0
let g:indentLine_enabled  = 0
let g:indentLine_color_gui = '#d6d6d6'
let g:indentLine_char = '┋'
let g:indentLine_char = '│'

nnoremap <F2> :call ToggleIndentLines()<CR>
function! ToggleIndentLines()
    if g:indentLine_myToggle == 0
        silent exec "IndentLinesToggle"
        echo "Showing tab markers"
        let g:indentLine_myToggle = 1
        set conceallevel=2
    else
        silen exec "IndentLinesToggle"
        echo "Hiding tab markers"
        let g:indentLine_myToggle = 0
        set conceallevel=0
    endif
endfunction

" GitGutter: Git file changes visualization {{{2

let g:gitgutter_enabled = 0
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0

nnoremap <F3> :call ToggleAllGitGutter()<CR>
function! ToggleAllGitGutter()
    silent exec "GitGutterToggle"
    silent exec "GitGutterSignsToggle"
    silent exec "GitGutterLineHighlightsToggle"
    if g:gitgutter_highlight_lines == 1
        echo "Showing git differences"
    else
        echo "Hiding git differences"
    endif
endfunction

" LaTeX: Custom LaTeX Options {{{2

let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_fold_enabled    = 0
let g:vimtex_imaps_leader    = ','
let g:vimtex_view_general_viewer  = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_quickfix_ignore_filters = ['mathpple']

let g:vimtex_complete_recursive_bib = 1
" let g:vimtex_complete_enabled = 1
" let g:vimtex_view_automatic   = 1
" let Tex_FoldedEnvironments    = ",frame,flashcard,tacomment,theorem,proof,definition"

" source $HOME/.local/share/nvim/plugged/vimtex/autoload/vimtex/syntax/p/amsmath.vim
" call VimtexNewMathZone('E', 'align*', 1)

nmap <leader>li  <plug>(vimtex-info)
nmap <leader>lI  <plug>(vimtex-info-full)
nmap <leader>lt  <plug>(vimtex-toc-open)
nmap <leader>lT  <plug>(vimtex-toc-toggle)
nmap <leader>ly  <plug>(vimtex-labels-open)
nmap <leader>lY  <plug>(vimtex-labels-toggle)
nmap <leader>lv  <plug>(vimtex-view)
nmap <leader>lr  <plug>(vimtex-reverse-search)
nmap <leader>ll  <plug>(vimtex-compile)
nmap <leader>lL  <plug>(vimtex-compile-selected)
xmap <leader>lL  <plug>(vimtex-compile-selected)
nmap <leader>lk  <plug>(vimtex-stop)
nmap <leader>lK  <plug>(vimtex-stop-all)
nmap <leader>le  <plug>(vimtex-errors)
nmap <leader>lo  <plug>(vimtex-compile-output)
nmap <leader>lg  <plug>(vimtex-status)
nmap <leader>lG  <plug>(vimtex-status-all)
nmap <leader>lc  <plug>(vimtex-clean)
nmap <leader>lC  <plug>(vimtex-clean-full)
nmap <leader>lm  <plug>(vimtex-imaps-list)
nmap <leader>lx  <plug>(vimtex-reload)
nmap <leader>ls  <plug>(vimtex-toggle-main)
" let g:vimtex_imaps_disabled = ['e', 'f', 've', 'vf']

" Markdown Composer: Instant markdown preview {{{2

" let g:previm_open_cmd = 'chromium'
" let g:markdown_composer_browser = 'chromium'
" let g:markdown_composer_autostart = 0
let g:markdown_fenced_languages = [
            \ 'bash=sh', 'sh', 'javascript', 'python', 'sql',
            \ 'r', 'SAS=sas', 'sas', 'Stata=stata', 'stata'
            \ ]
let g:vim_markdown_fenced_languages = g:markdown_fenced_languages
" let g:instant_markdown_autostart = 0

" NERDTree: Nice file explorer for Vim {{{2

nnoremap <F10> :NERDTreeToggle<CR>
let NERDTreeMapHelp     = 1
let NERDTreeMinimalUI   = 1
" let g:NERDTreePath      = 1
" let g:NERDTreeDirNode   = 1
" let g:NERDTreeFileNode  = 1
" let g:NERDTreeBookmark  = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "→",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Devicons: Pretty icons on all the things {{{2

let g:webdevicons_enable_nerdtree                  = 1
let g:webdevicons_enable_airline_tabline           = 1
let g:webdevicons_enable_airline_statusline        = 1
let g:webdevicons_enable_ctrlp                     = 1
let g:WebDevIconsUnicodeDecorateFileNodes          = 1
let g:WebDevIconsUnicodeDecorateFolderNodes        = 1
let g:DevIconsEnableFoldersOpenClose               = 1
let g:webdevicons_conceal_nerdtree_brackets        = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding         = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign      = 0

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" VimCmdLine: Embedded Shell {{{2

" I usually call Stata, etc. over ssh; to change, see
" ~/.local/share/nvim/plugged/cmdline/ftplugin
let cmdline_app = {}
let cmdline_app['zsh']    = '/usr/bin/zsh'
let cmdline_app['stata']  = '/usr/bin/zsh'
let cmdline_app['python'] = 'ipython3'

let cmdline_external_term_cmd = "konsole -e '%s' &"
" let cmdline_map_send          = '<LocalLeader><Space>'
" let cmdline_map_send_and_stay = '<Space>'

" CtrlP: Fast file navitation {{{2

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor -g ""'
endif

let g:ctrlp_follow_symlinks = 1
nnoremap <C-g> :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 'VXt'
" let g:fzf_command_prefix = 'Fzf'

" Telescope: Gaze deeply into unknown regions using the power of the moon {{{2

nnoremap <leader>;f  <cmd>lua require'telescope.builtin'.find_files({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;r  <cmd>lua require'telescope.builtin'.live_grep({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;c  <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;;  <cmd>lua require'telescope.builtin'.builtin({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;s  <cmd>lua require'telescope.builtin'.spell_suggest(require('telescope.themes').get_cursor({}))<cr>
nnoremap <leader>;b  <cmd>lua require'telescope.builtin'.buffers({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;gf <cmd>lua require'telescope.builtin'.git_files({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;gs <cmd>lua require'telescope.builtin'.git_status({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;gb <cmd>lua require'telescope.builtin'.git_branches({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;gc <cmd>lua require'telescope.builtin'.git_commits({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
nnoremap <leader>;j  <cmd>lua require'telescope.builtin'.jumplist({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>

" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.grep_string(require('telescope.themes').get_cursor({}))<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.planets({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.git_files({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.oldfiles({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.commands({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.command_history({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.search_history({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.help_tags({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.marks({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.loclist({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.vim_options({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.registers({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.autocommands({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.keymaps({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.filetypes({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.highlights({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.git_stash({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>
" nnoremap <leader>;xx <cmd>lua require'telescope.builtin'.git_bcommits({layout_strategy='vertical',layout_config={preview_height=0.75}})<cr>

" Ale: Asynchronous Lint Engine {{{2

let g:airline#extensions#ale#enabled = 1
" let g:ale_completion_enabled = 0
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_set_loclist  = 0
" let g:ale_set_quickfix = 1
" let g:ale_python_flake8_executable = '/usr/bin/flake8 --ignore=E221,E251,E241,E501'
" let g:ale_python_flake8_executable = 'flake8-python2'

autocmd BufNewFile,BufRead *.py call SwitchFlake8()
nnoremap <F8> :ALEToggle<CR>
function SwitchFlake8()
    if getline(1) =~ 'python2'
        let g:ale_python_flake8_executable = 'flake8-python2'
    else
        let g:ale_python_flake8_executable = 'flake8'
    end
endfunc

" Startify: Nice start screen {{{2

let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_list_order = [
            \ ['    Sessions:'],
            \ 'sessions',
            \ ['    Bookmarks:'],
            \ 'bookmarks',
            \ ['    My most recently used files:'],
            \ 'files',
            \ ['    My most recently used files in the current directory:'],
            \ 'dir',
            \ ]
let g:startify_bookmarks = [
            \ '~/.local/share/nvim',
            \ '$projects'
            \]
let g:startify_session_persistence = 1

" Tabular: Nice alignment features {{{2

vnoremap <leader>at :Tabularize /&<CR>
nnoremap <leader>at :Tabularize /&<CR>

vnoremap <leader>a# :Tabularize /#/l1r1<CR>
vnoremap <leader>a% :Tabularize /%/l1r1<CR>
vnoremap <leader>a& :Tabularize /&/l1r1<CR>
vnoremap <leader>a* :Tabularize /*/l1r1<CR>
vnoremap <leader>a= :Tabularize /=/l1r1<CR>
vnoremap <leader>a- :Tabularize /-/l1r1<CR>
vnoremap <leader>a, :Tabularize /,/l1r1<CR>
vnoremap <leader>a" :Tabularize /"/l1r1<CR>
vnoremap <leader>a: :Tabularize /:/l1r1<CR>
vnoremap <leader>a; :Tabularize /;/l1r1<CR>
vnoremap <leader>a$ :Tabularize /$/l1r1<CR>
vnoremap <leader>a/ :Tabularize /\/\/\+/l1r1<CR>
vnoremap <leader>a\ :Tabularize /\\\\\+/l1r1<CR>

nnoremap <leader>a# mm:Tabularize /#/l1r1<CR>`m
nnoremap <leader>a% mm:Tabularize /%/l1r1<CR>`m
nnoremap <leader>a& mm:Tabularize /&/l1r1<CR>`m
nnoremap <leader>a* mm:Tabularize /*/l1r1<CR>`m
nnoremap <leader>a= mm:Tabularize /=/l1r1<CR>`m
nnoremap <leader>a- mm:Tabularize /-/l1r1<CR>`m
nnoremap <leader>a, mm:Tabularize /,/l1r1<CR>`m
nnoremap <leader>a" mm:Tabularize /"/l1r1<CR>`m
nnoremap <leader>a: mm:Tabularize /:/l1r1<CR>`m
nnoremap <leader>a; mm:Tabularize /;/l1r1<CR>`m
nnoremap <leader>a$ mm:Tabularize /$/l1r1<CR>`m
nnoremap <leader>a/ mm:Tabularize /\/\/\+/l1r1<CR>`m
nnoremap <leader>a\ mm:Tabularize /\\\\\+/l1r1<CR>`m

vnoremap <leader>z# :Tabularize /#\zs/l0r1<CR>
vnoremap <leader>z% :Tabularize /%\zs/l0r1<CR>
vnoremap <leader>z& :Tabularize /&\zs/l0r1<CR>
vnoremap <leader>z* :Tabularize /*\zs/l0r1<CR>
vnoremap <leader>z= :Tabularize /=\zs/l0r1<CR>
vnoremap <leader>z- :Tabularize /-\zs/l0r1<CR>
vnoremap <leader>z, :Tabularize /,\zs/l0r1<CR>
vnoremap <leader>z" :Tabularize /"\zs/l0r1<CR>
vnoremap <leader>z: :Tabularize /:\zs/l0r1<CR>
vnoremap <leader>z; :Tabularize /;\zs/l0r1<CR>
vnoremap <leader>z$ :Tabularize /$\zs/l0r1<CR>
vnoremap <leader>z/ :Tabularize /\/\/\+\zs/l0r1<CR>
vnoremap <leader>z/ :Tabularize /\\\\\+\zs/l0r1<CR>

nnoremap <leader>z# mm:Tabularize /#\zs/l0r1<CR>`m
nnoremap <leader>z% mm:Tabularize /%\zs/l0r1<CR>`m
nnoremap <leader>z& mm:Tabularize /&\zs/l0r1<CR>`m
nnoremap <leader>z* mm:Tabularize /*\zs/l0r1<CR>`m
nnoremap <leader>z= mm:Tabularize /=\zs/l0r1<CR>`m
nnoremap <leader>z- mm:Tabularize /-\zs/l0r1<CR>`m
nnoremap <leader>z, mm:Tabularize /,\zs/l0r1<CR>`m
nnoremap <leader>z" mm:Tabularize /"\zs/l0r1<CR>`m
nnoremap <leader>z: mm:Tabularize /:\zs/l0r1<CR>`m
nnoremap <leader>z; mm:Tabularize /;\zs/l0r1<CR>`m
nnoremap <leader>z$ mm:Tabularize /$\zs/l0r1<CR>`m
nnoremap <leader>z/ mm:Tabularize /\/\/\+\zs/l0r1<CR>`m
nnoremap <leader>z\ mm:Tabularize /\\\\\+\zs/l0r1<CR>`m

" UltiSnips: Fairly amazing snippet plugin {{{2

" let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger    = "<s-space>"
let g:ultisnips_python_style    = "google"
" let g:ultisnips_python_style    = "doxygen"
if has('nvim')
    let g:UltiSnipsSnippetsDir  = "~/.local/share/nvim/plugged/snippets/UltiSnips"
else
    let g:UltiSnipsSnippetsDir  = "~/.vim/plugged/snippets/UltiSnips"
endif
" let g:UltiSnipsRemoveSelectModeMappings = 0

" TComment: Easy commenting {{{2

call tcomment#type#Define('stata', '* %s')
call tcomment#type#Define('stata_inline', '// %s')

" NVR: NeoVim Remote {{{2

" NeoTerm: NeoVim terminal commands {{{2

nnoremap ,p :TREPLSendLine<CR>
vnoremap ,p :TREPLSendSelection<CR>

" NCM2: NeoVim Completion Manager 2 {{{2

autocmd BufEnter * call ncm2#enable_for_buffer()
" autocmd TextChangedI * call ncm2#auto_trigger()
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
"
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Undo: Visualize undo history {{{2

nnoremap <F9> :UndotreeToggle<CR>

" VimWiki: {{{2

let g:vimwiki_key_mappings = { 'table_mappings': 0 }
let g:vimwiki_table_mappings = 0
" See ~/.config/nvim/after/ftplugin/vimwiki.vim

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
