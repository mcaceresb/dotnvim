Personal NeoVim Installation
============================

Local Installation
------------------

Requirements:

- NeoVim (from your OS repository or follow the instructions on [github.com/neovim/neovim](https://github.com/neovim/neovim)).
- A [Nerd Font](https://github.com/ryanoasis/nerd-fonts); I personally use the patched `SourceCodePro` (Sauce Code Pro). I rely heavily on a patched fonts for various symbols.

Installation:

```bash
git clone https://github.com/mcaceresb/dotnvim && cd dotnvim
ln -sf `pwd`/init.lua  ~/.config/nvim/init.lua
ln -sf `pwd`/lua       ~/.config/nvim
ln -sf `pwd`/custom    ~/.config/nvim
```

Server Installation
-------------------

1. Make sure you're using bash: From a terminal,

    - Run `chsh`
    - Type `/bin/bash`
    - Press enter
    - Log out and log back in

2. Set up a repository for all your local executables: From a terminal

    - Run `mkdir $HOME/bin`
    - Run `echo export PATH=\$HOME/bin:\$PATH >> $HOME/.bashrc`

3. Download the requirements:

    - NeoVim: Download the latest development or stable version from the [releases page](https://github.com/neovim/neovim/releases). Example:

        ```bash
        wget --output-file=$HOME/bin/nvim https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
        chmod +x $HOME/bin/nvim
        ```

    - `ripgrep`: Download the latest from the [releases page](https://github.com/BurntSushi/ripgrep/releases) (almost surely the 64-bit linux version)

        ```bash
        wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
        tar -xvf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
        ln -sf `pwd`/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg $HOME/bin/rg
        ```

    - `fd` file finder:

        ```
        https://github.com/sharkdp/fd/releases/download/v8.7.0/fd-v8.7.0-i386-unknown-linux-gnu.tar.gz
        tar -xvf fd-v8.7.0-i386-unknown-linux-gnu.tar.gz
        ln -sf `pwd`/fd-v8.7.0-i386-unknown-linux-gnu/fd $HOME/bin/fd
        ```

    - `xsel` (or `xclip`) if neither is installed. I had to build `xsel` like this:

        ```bash
        git clone https://github.com/kfish/xsel
        cd xsel
        git checkout 1.0.0
        aclocal
        automake --add-missing
        autoconf
        ./configure --prefix=$HOME
        make CFLAGS=-Wno-stringpop-truncation
        make install
        ln -sf $HOME/usr/bin/xsel $HOME/bin/xsel
        ```

4. Install a [nerd font](https://github.com/ryanoasis/nerd-fonts)

    - You can pick any font from [here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)
    - I favor SourceCodePro. You can download a single folder from a git repo via [DownGit](https://minhaskamal.github.io/DownGit/#/home)
    - Example: 

        - Copy `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro` to DownGit
        - Click "Download" (or "Create Download Link" then get the link)
        - Download `https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro`
        - Unzip to `$HOME/.loca/share/fonts`

        ```
        unzip SourceCodePro.zip
        ln -sf `pwd`/SourceCodePro $HOME/.loca/share/fonts/SourceCodePro
        fc-cache $HOME/.loca/share/fonts
        ```

    - Set your terminal's font to your newly downloaded font (it will be something like Edit > Profiles > Edit > Font)

5. You're set to try out neovim! Install this repository as indicated [above](#local-installation)

6. However, I might recommend you try a neovim distribution. There are several that are easy to try and fairly popular!

```bash
# Before switching to any distribution, remove the old files
rm -f ~/.config/nvim/lazy-lock.json
rm -f ~/.config/nvim/init.lua
rm -f ~/.config/nvim/lua

# AstroNvim
ln -sf ~/bulk/lib/AstroNvim/init.lua        ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/AstroNvim/lua             ~/.config/nvim/lua

# LazyVim
ln -sf ~/bulk/lib/LazyVimStarter/init.lua   ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/LazyVimStarter/lua        ~/.config/nvim/lua

# NvChad
ln -sf ~/bulk/lib/NvChad/init.lua           ~/.config/nvim/init.lua
ln -sf ~/bulk/lib/NvChad/lua                ~/.config/nvim/lua

# Back to mine
ln -sf ~/code/dotnvim/init.lua              ~/.config/nvim/init.lua
ln -sf ~/code/dotnvim/lua                   ~/.config/nvim/lua
```

License
-------

MIT
