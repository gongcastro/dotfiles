#!/bin/bash

function setup() {
sudo apt-get update
sudo apt-get upgrade

# git
sudo apt-get install git -y
git config --global core.editor nvim
git config --global init.defaultBranch main 
git config --global user.name gongcastro
git config --global user.email gongarciacastro@gmail.com

# tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks -y
 
# homebrew
sudo apt-get install build-essential procps curl file -y
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

# deps
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module wget -y

# R
sudo apt update -qq
sudo apt install --no-install-recommends software-properties-common dirmngr -y
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install --no-install-recommends r-base -y
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y


# oh my posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install FiraCode
mkdir $HOME/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O $HOME/.poshthemes/themes.zip
unzip $HOME/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw $HOME/.poshthemes/*.json
rm $HOME/.poshthemes/themes.zip
wget -O $HOME/.poshthemes/gongcastro.omp.json https://raw.githubusercontent.com/gongcastro/setup/main/themes/gongcastro.omp.json
echo 'eval "$(oh-my-posh init bash --config $HOME/.poshthemes/gongcastro.omp.json)"' >> $HOME/.bashrc

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage


# Praat
sudo apt-get install praat -y
sudo apt install fonts-sil-charis
sudo apt install fonts-sil-doulos 

# audacity
sudo apt-get install audacity -y

# docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
 
	# Zotero
	sudo snap install zotero-snap -y

	# Julia 
	curl -fsSL https://install.julialang.org | sh

	# MySQL
	sudo apt install mysql-server -y
	
	# Quarto
	sudo curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
	sudo apt-get install gdebi-core -y
	sudo gdebi quarto-linux-amd64.deb
	/usr/local/bin/quarto check

	# Zoom
	wget -O $HOME/Downloads/package-signing-key.pub https://zoom.us/linux/download/pubkey?version=5-12-6
	gpg --show-keys $HOME/Downloads/package-signing-key.pub
	sudo gpg --import $HOME/Downloads/package-signing-key.pub
	wget -O $HOME/Downloads/https://zoom.us/client/latest/zoom_amd64.deb
	sudo apt install $HOME/Downloads/zoom_amd64.deb -y

}
