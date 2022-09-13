#! /bin/bash

echo "Update system..."
sudo pacman -Syu --noconfirm > /dev/null
echo "System updated"

echo "Install packages..."
sudo pacman -S --noconfirm $(cat ./packages.txt) > /dev/null
echo "Packages Installed"

stow -t ~/ .
echo "Configs linked to home directory"

if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim > /dev/null
    echo "Packer installed"
else
    echo "Packer detected"
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


