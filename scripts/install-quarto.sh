#!/bin/bash

echo "Installing Quarto"
sudo curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo apt-get install gdebi-core -y
sudo gdebi quarto-linux-amd64.deb
/usr/local/bin/quarto check
