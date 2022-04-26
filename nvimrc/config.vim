" ----------------------------------------------------------------------------
" Program: config.vim
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Thu Jun  4 03:16:32 EDT 2015
" Updated: Tue Apr 26 12:49:31 EDT 2022
" Purpose: Preferred options

" Essential: Options to make Vim behave more sanely {{{1

set autochdir         " Change directory to file in buffer
set autoindent        " Copy last line's indent
set autoread          " Automatically re-read file on change
set display+=lastline " Display as much text as possible in last line
set formatoptions+=j  " Delete comment char when joining lines
set hlsearch          " Highlight search pattern
set ignorecase        " Ignore case of letters in pattern search
set incsearch         " Search incrementally as you type
set laststatus=2      " Last window always has a status line
set lazyredraw        " Don't redraw screen while executing macros
set noswapfile        " Don't use swap files
set nrformats-=octal  " Remove octal from number formats
set number            " Show line numbers in left margin
set ruler             " Show line and column numbers in status line
set showcmd           " Show selection size in visual mode
set smartcase         " Override ignorecase when upper letter is typed
set smarttab          " <Tab> (<BS>) inserts (removes) spaces w/shiftwidth
set wildchar=<Tab>    " Invoke wildmenu completion using <Tab>
set wildmenu          " Enhanced command-line completion
set winaltkeys=no     " Allow using alt keys for vim mappings
set backspace=indent,eol,start " Backspace over indent, line start, eol

" Prefer UTF-8
if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8 ambiwidth=double
endif

" More history
if &history < 1024
    set history=1024
endif

" More tab pages
if &tabpagemax < 42
    set tabpagemax=42
endif

" Preferences: Some personal tweaks {{{1

if exists('+breakindent')
  set breakindent          " Soft wrap respecting visual indentation
endif
set colorcolumn=           " Don't highlight any columns
set conceallevel=0         " Don't conceal any characters
set expandtab              " Insert spaces for tabs, like a sane person
set guioptions=acer        " Minimal GUI
set infercase              " Smart case in insert-mode completion
set linebreak              " Break long lines at 'breakat'
set nolist                 " 'linebreak' won't work with nolist
set shiftwidth=4           " Ibid, but to auto-indent
set showbreak=\ \          " Prepend to start of soft-wrapped line
set softtabstop=4          " Ibid, but while editing (e.g. <Tab>, <BS>)
set scrolloff=2            " Vertical scroll lines offset
set sidescrolloff=4        " Horizontal scroll columns offset
set splitbelow             " Open splits on bottom half of current buffer
set splitright             " vsplit splits right
set tabstop=4              " Spaces a tab counts for, visually
set wrap                   " Soft-wrap text
" set shortmess+=c           " Suppress superfluous completion messages
set completeopt=noinsert,menuone,noselect
" set completeopt=menu,preview

" Spelling support (toggle with <leader>s for :set spell!<CR>)
if has('gui_running') | set spell | else | set nospell | endif

" Note to self: Cursorline is fun but painfully SLOW
" set cursorline             " Highlight the line the cursor is on

" Set listchars
" tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
" extends:>,precedes:<,nbsp:+,trail:·,
set listchars=tab:»\ ,eol:¬ 

" Remember more undo
if &undoreload < 8192
    set undoreload=8192
endif

if &undolevels < 1024
    set undolevels=1024
endif

if has("persistent_undo")
    set undodir=$HOME/.local/share/nvim/undo
    set undofile
endif

" Use par for hard-wrapping text (requires par)
if executable('par')
    set formatprg=par\ -w72req
endif

" Adequately toggle soft-wrap and no soft-wrap
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap nolinebreak

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
