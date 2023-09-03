#!/bin/bash

echo "update, upgrade and install some stuffs"

sudo add-apt-repository ppa:aslatter/ppa -y
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo

sudo apt -y update && sudo apt -y upgrade && sudo apt -y install \
    gcc \
    g++ \
    tree \
    unzip \
    htop \
    ripgrep \
    fd-find \
    curl \
    wget \
    git \
    ninja-build \
    make \
    cmake \
    rar \
    unrar \
    zip \
    telegram-desktop \
    simplescreenrecorder \
    software-properties-common\
    apt-transport-https \
    libglu1-mesa \
    clang \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    alacritty \
    zsh \
    tmux \
    gnome-tweaks \
    dconf-editor \
    chrome-gnome-shell \
    vlc 

echo "install asdf (version manager)"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

echo "install postman"
wget https://dl.pstmn.io/download/latest/linux_64 -P ~/Downloads
sudo tar -xvf ~/Downloads/linux_64 -C /opt/
cp ~/dotfiles/applications/Postman.desktop ~/.local/share/applications/

echo "install neovim (latest)"
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim ~/Downloads/
cd ~/Downloads/neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
cp -r ~/dotfiles/.config/nvim ~/.config/nvim/

echo "install packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "install chrome"
sudo apt-get update
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
sudo apt install ./Downloads/google-chrome-stable_current_amd64.deb

echo "install ibus, ibus-bamboo"
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart
# Đặt ibus-bamboo làm bộ gõ mặc định
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

echo "install fonts"
cp -r ~/dotfiles/.fonts ~/.fonts
fc-cache -f -v

echo "install zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ~/dotfiles/.config/zsh/.zshrc ~/.zshrc

echo "config terminal"
mkdir ~/.config/alacritty 
cp ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/ 

echo "config tmux" 
cp ~/dotfiles/.config/tmux/.tmux.conf ~/.tmux.conf

gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.98
