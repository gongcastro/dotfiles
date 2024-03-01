#!/bin/bash

echo "Installing Oh My Posh with custom theme..."
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install FiraCode
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O "$XDG_CONFIG_HOME"/oh-my-posh/themes/themes.zip
unzip "$XDG_CONFIG_HOME"/oh-my-posh/themes/themes.zip -d "$XDG_CONFIG_HOME"/oh-my-posh/themes/
chmod u+rw "$XDG_CONFIG_HOME"/oh-my-posh/themes/*.json
rm "$XDG_CONFIG_HOME"/oh-my-posh/themes/themes.zip
wget -O "$XDG_CONFIG_HOME"/oh-my-posh/themes/gongcastro.omp.json https://raw.githubusercontent.com/gongcastro/setup/main/themes/gongcastro.omp.json
