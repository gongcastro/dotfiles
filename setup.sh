#!/bin/bash

# This is the setup script for my config. The idea is to be able to run
# this after cloning the repo on a Mac or Ubuntu (WSL) system and be up
# and running very quickly.

# create directories
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/bash
mkdir -p "$XDG_CONFIG_HOME"/oh-my-posh/themes
mkdir -p "$XDG_CONFIG_HOME"/oh-my-zsh/themes

# set up git prompt
# curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh >"$XDG_CONFIG_HOME"/bash/git-prompt.sh

# ubuntu packages apt
sudo add-apt-repository universe
sudo apt-get install -y wget \
    cmake \
    make \
    g++ \
    gcc \
    unzip \
    gnome-tweaks \
    ripgrep \
    gh \
    fzf \
    pkg-config \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libimlib2-dev \
    libncurses5-dev \
    libx11-dev \
    libxdamage-dev \
    libxft-dev \
    libxinerama-dev \
    libxml2-dev \
    libxext-dev \
    libcurl4-openssl-dev \
    liblua5.3-dev

# symbolic links ---------------
if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/gongcastro/dotfiles "$DOTFILES"
fi

cp -a "$DOTFILES/scripts/." "$HOME/bin"
cp "$DOTFILES/themes/gongcastro.omp.json" "$XDG_CONFIG_HOME/oh-my-posh/themes/"

ln -sf "$DOTFILES/.bash_profile" "$HOME"/.bash_profile
ln -sf "$DOTFILES/.bash_aliases" "$HOME"/.bash_aliases
ln -sf "$DOTFILES/.bashrc" "$HOME"/.bashrc
ln -sf "$DOTFILES/.zshrc" "$HOME"/.zshrc
ln -sf "$DOTFILES/.vimrc" "$HOME"/.vimrc
ln -sf "$DOTFILES/.zsh_aliases" "$HOME"/.zsh_aliases
ln -sf "$DOTFILES/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "$DOTFILES/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$DOTFILES/themes/gongcastro.omp.json" "$XDG_CONFIG_HOME/oh-my-posh/themes"
ln -sf "$DOTFILES/themes/gongcastro.zsh-theme" "$XDG_CONFIG_HOME/oh-my-zsh/themes"

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim go lazygit oh-my-posh
git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"

if [[ ! -d "$HOME/bin" ]]; then
    mkdir $HOME/bin
fi
