" ----------------------------------------------------------------------------
" Program: init.vim
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Wed Aug 17 18:58:19 EDT 2016
" Updated: Mon Aug 07 17:13:52 EDT 2023
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
set termguicolors

" Source plug-ins and configure them
let g:python3_host_prog = '/usr/bin/python3'
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'

exec 'source ' . s:path . 'plugins.vim'
exec 'source ' . s:path . 'config.vim'
exec 'source ' . s:path . 'mappings.vim'
exec 'source ' . s:path . 'functions.vim'
exec 'source ' . s:path . 'autocmd.vim'
exec 'source ' . s:path . 'colors.vim'
