#!/bin/bash

echo "Installing Zoom..."
wget -O $HOME/Downloads/package-signing-key.pub https://zoom.us/linux/download/pubkey?version=5-12-6
gpg --show-keys $HOME/Downloads/package-signing-key.pub
sudo gpg --import $HOME/Downloads/package-signing-key.pub
wget -O $HOME/Downloads/https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install $HOME/Downloads/zoom_amd64.deb -y
