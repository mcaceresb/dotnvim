#!/usr/bin/env bash

mkdir -p ~/.config/nvim/spell
mkdir -p ~/.local/share/nvim/session
mkdir -p ~/.local/share/nvim/undo
mkdir -p ~/.local/share/nvim/site/autoload

SCRIPT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT=${SCRIPT}/..
cp -f ${ROOT}/install/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
cp -sf ${ROOT}/nvimrc/*  ~/.config/nvim/

cp ${ROOT}/snippets/snippets/*  ~/.local/share/nvim/plugged/snippets/snippets/  -sf
cp ${ROOT}/snippets/UltiSnips/* ~/.local/share/nvim/plugged/snippets/UltiSnips/ -sf
