#!/bin/bash

echo "Installing R..."
sudo apt update -qq
sudo apt install --no-install-recommends software-properties-common dirmngr -y
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install --no-install-recommends r-base -y
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y

echo "Installing radian, R linters, and R packages..."
# setup radian and vs-code features
Rscript -e 'install.packages(c("devtools"))'
Rscript -e 'remotes::install_github("nx10/httpgd")'
Rscript -e 'remotes::install_github("r-lib/lintr")'
pip install --user radian
echo 'alias r="/home/gongcastro/.local/bin/radian"' >>~/.bash_aliases
