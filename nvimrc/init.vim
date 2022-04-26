" ----------------------------------------------------------------------------
" Program: init.vim
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Wed Aug 17 18:58:19 EDT 2016
" Updated: Tue Apr 26 12:15:43 EDT 2022
" Purpose: Preferred NeoVim Settings (full)

" Startup: Source plugins, options, config, etc.

" Enable syntax, plug-ins
filetype plugin indent on
syntax enable

" So all <Leader> and <LocalLeader> mappings are done correctly
let mapleader = ","
let maplocalleader = "\\"

" Dark background; use improved colors with nvim
set background=dark
if has('nvim')
    set termguicolors
endif

" Source plug-ins and configure them
let g:python3_host_prog = '/usr/bin/python3'
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
exec 'source ' . s:path . 'plugins.vim'
exec 'source ' . s:path . 'config.vim'

" Configure Vim to your liking and source your mappings
exec 'source ' . s:path . 'mappings.vim'
exec 'source ' . s:path . 'functions.vim'
exec 'source ' . s:path . 'autocmd.vim'
exec 'source ' . s:path . 'colors.vim'
