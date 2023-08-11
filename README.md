Personal NeoVim Installation
============================

Local Installation
------------------

Requirements:

- NeoVim (from your OS repository or follow the instructions on [github.com/neovim/neovim](https://github.com/neovim/neovim)).
- A [Nerd Font](https://github.com/ryanoasis/nerd-fonts); I personally use the patched `SourceCodePro` (Sauce Code Pro). I rely heavily on a patched fonts for various symbols.

Installation:

```bash
ln -sf `pwd`/init.lua  ~/.config/nvim/init.lua
ln -sf `pwd`/lua       ~/.config/nvim
ln -sf `pwd`/custom    ~/.config/nvim
ln -sf `pwd`/snippets  ~/.config/nvim
```

Server Installation
-------------------

Try out whichever you prefer

1. Set up ~/bin in path
2. Noeovim binary
3. rg, fd, xsel
4. Distros, etc.
5. Font

```bash
rm -f ~/.config/nvim/lazy-lock.json
rm -f ~/.config/nvim/init.lua
rm -f ~/.config/nvim/lua

ln -sf ~/code/dotnvim/init.lua              ~/.config/nvim/init.lua
ln -sf ~/code/dotnvim/lua                   ~/.config/nvim/lua

ln -sf ~/bulk/lib/AstroNvim/init.lua        ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/AstroNvim/lua             ~/.config/nvim/lua

ln -sf ~/bulk/lib/LazyVimStarter/init.lua   ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/LazyVimStarter/lua        ~/.config/nvim/lua

ln -sf ~/bulk/lib/NvChad/init.lua           ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/NvChad/lua                ~/.config/nvim/lua
```

License
-------

MIT
