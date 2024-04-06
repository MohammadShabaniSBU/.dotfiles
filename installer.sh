! /bin/bash

function updatePacman() {
    sudo pacman -Syu --noconfirm
}

function installParu() {
    sudo pacman -S --needed base-devel
    currentDir=$(pwd)

    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si

    cd $currentDir
}

function installPackages() {
    sudo paru -S --noconfirm $(cat ./packages.txt) 
}

function linkConfigs() {
    stow -t ~/ .
}

function installNvim() {
    git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
    git clone https://github.com/MohammadShabaniSBU/AstroNvim ~/.config/nvim/lua/user
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

updatePacman
installParu
installPackages
linkConfigs
installNvim
zsh_full
