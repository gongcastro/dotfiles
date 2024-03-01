#!/bin/bash

echo "Installing Git..."
sudo apt-get install git -y
git config --global core.editor nvim
git config --global init.defaultBranch main
git config --global user.name gongcastro
git config --global user.email gongarciacastro@gmail.com
