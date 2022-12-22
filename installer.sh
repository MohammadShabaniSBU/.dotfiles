#! /bin/bash

#sudo pacman -Syu --noconfirm 

#sudo pacman -S --noconfirm $(cat ./packages.txt) 

#stow -t ~/ .

function installNvim() {
    if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
        git clone --depth 1 https://github.com/wbthomason/packer.nvim\
            ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
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
}

function zsh_full() {
    #install oh my zsh
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

    # install powerlevel10k theme 
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ~/.oh-my-zsh/custom/themes/powerlevel10k

    # autosuggestion, fast syntax highlight, autocomplete
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
        ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
        ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
    git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git \
        ~/.oh-my-zsh/custom/plugins/zsh-autocomplete

    chsh -s "$(which zsh)"
}

#installNvim
#zsh_full
