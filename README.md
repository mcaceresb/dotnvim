Personal NeoVim Installation
============================

Local Installation
------------------

Requirements:

- NeoVim (from your OS repository or follow the instructions on [github.com/neovim/neovim](https://github.com/neovim/neovim)).
- A [Nerd Font](https://github.com/ryanoasis/nerd-fonts); I personally use the patched `SourceCodePro` (Sauce Code Pro). I rely heavily on a patched fonts for various symbols.

Installation:

```bash
mkdir ~/.config/nvim
git clone https://github.com/mcaceresb/dotnvim
ln -sf `pwd`/dotnvim/init.lua  ~/.config/nvim/init.lua
ln -sf `pwd`/dotnvim/lua       ~/.config/nvim/lua
ln -sf `pwd`/dotnvim/custom    ~/.config/nvim/custom
```

Start NeoVim; the first time it boots up it will automagically install all required packages.

Fallback
--------

If you want to tinker with your config files, it might be a good idea to set up a backup folder to load while debugging the config. If you're trying out a package or if your config breaks, it can be annoying to try and fix it from neovim while the config files aren't working as expected.

```
ln -sf `pwd`/neovim ~/.config/nvimbak
ln -sf ~/.local/share/nvim ~/.local/share/nvimbak
ln -sf ~/.local/state/nvim ~/.local/state/nvimbak
```

Then load neovim with your backup settings

```
NVIM_APPNAME=nvimbak nvim
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

5. You're set to try out neovim! You can install this repository as indicated [above](#local-installation). My normal workflow

    - Open a vertical split (`:vsp<CR>`)
    - Make it into a terminal (`:Tnew<CR>`)
    - (ssh into server if necessary)
    - Start program in terminal (Stata, Python, R, etc.)
    - Send lines from code into terminal (`:TREPLSendLine<CR>` or `:TREPLSendSelection<CR>`)

6. I really recommend you try a neovim distribution. There are several that are easy to try and fairly popular! Their aesthetics are much nicer and their configurations more polished (my own setup here is very much a WIP). While their defaults drive me crazy (because I'm used to my own), if you're just starting out then you shouldn't have that issue. (I find NvChad has the most polished looks but I dislike its defaults the most, for instance.)

```bash
# Before switching to any distribution, remove the old files.
# This step is IMPORTANT otherwise the new install won't work!
rm -f ~/.config/nvim/lazy-lock.json
rm -f ~/.config/nvim/init.lua
rm -f ~/.config/nvim/lua

# If you run into issues, you might need to also clear the package cache
# rm -rf ~/.local/share/nvim/lazy

# NvChad
git clone https://github.com/NvChad/NvChad
ln -sf `pwd`/NvChad/init.lua ~/.config/nvim/init.lua
ln -sf `pwd`/NvChad/lua      ~/.config/nvim/lua

# LazyVim
git clone https://github.com/LazyVim/starter LazyVimStarter
ln -sf `pwd`/LazyVimStarter/init.lua ~/.config/nvim/init.lua
ln -sf `pwd`/LazyVimStarter/lua      ~/.config/nvim/lua

# AstroNvim
git clone https://github.com/AstroNvim/AstroNvim
ln -sf `pwd`/AstroNvim/init.lua ~/.config/nvim/init.lua
ln -sf `pwd`/AstroNvim/lua      ~/.config/nvim/lua

# Back to mine
ln -sf `pwd`/dotnvim/init.lua ~/.config/nvim/init.lua
ln -sf `pwd`/dotnvim/lua      ~/.config/nvim/lua
```

You can read each of those project's documentations to see what they're all about. For the distributions, you might not be able to use some packages (e.g. if a program like npm is not installed on the server) but that's fine. Note all four options have some commonalities:

- Code completion as you type (a pop-up with suggestions for words, files, functions, etc.) with previous and documentation, as applicable.
- Search via [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)
- A file explorer
- A terminal
- A status line

And a few others. Some differences are purely aesthetic (I like a plash page, which LazyVim also has, but you might not) and all are configurable.

License
-------

MIT
