#! /bin/bash

sudo pacman -Syu --noconfirm 

sudo pacman -S --noconfirm $(cat ./packages.txt) 

stow -t ~/ .

if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
else
fi

nvim --headless \
    +so ~/.config/nvim/lua/mohammad/packer.lua \
    +PackerInstall \
    +q

nvim --headless \
    +so ~/.config/nvim/lua/plugins/mason.lua \
    +MasonInstall \
        clangd \
        dockerfile-language-server \
        goimports \
        gopls \
        json-lsp \
        python-lsp-server \
        rust-analyzer \
        typescript-language-server \
    +qa


