if exists('g:loaded_vimwiki') && g:loaded_vimwiki == 1
    inoremap <expr><buffer> <C-j> vimwiki#tbl#kbd_tab()
    inoremap <expr><buffer> <C-k> vimwiki#tbl#kbd_shift_tab()
end
