Minimal NeoVim Installation
===========================

Two goals

- Portability (especially to servers)
- Reflects my current neovim setup

This replaces `$HOME/code/dotvim`.

Extras
------

I much recommend using a [Nerd Font](https://github.com/ryanoasis/nerd-fonts). I personally use the patched `SourceCodePro` and rely on patch fonts for various symbols defined throughout the configuration.

Installation
------------

This assumes NeoVim is already installed (from your OS repository or follow the instructions on [github.com/neovim/neovim](https://github.com/neovim/neovim)).

- Run `bash install/install.sh`
- To install the plugins:
    - If you have an internet connection, enter neovim via `nvim -u ~/.config/nvim/init.vim -c PlugInstall`.
    - If you don't, you can copy the plugins to `~/.local/share/nvim/plugged`
- Extend snippets:
    - `cp ${ROOT}/snippets/snippets/*  ~/.local/share/nvim/plugged/snippets/snippets/  -sf`
    - `cp ${ROOT}/snippets/UltiSnips/* ~/.local/share/nvim/plugged/snippets/UltiSnips/ -sf`
    - Add `extends allmc` to the top of `all.snippets`
    - ibid. `extends juliamc` to `julia.snippets`
    - ibid. `extends pythonmc` to `python.snippets`

License
-------

MIT
