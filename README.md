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

- Run `install/install.sh`
- To install the plugins:
    - If you have an internet connection, enter neovim via `nvim -g ~/.config/nvim/init.vim -c PlugInstall`.
    - If you don't, you can copy the plugins to `~/.local/share/nvim/plugged`
- Extend snippets:
    - Add `extends allmc` to the top of `all.snippets`
    - ibid. `extends juliamc` to `julia.snippets`
    - ibid. `extends pythonmc` to `python.snippets`

License
-------

MIT
