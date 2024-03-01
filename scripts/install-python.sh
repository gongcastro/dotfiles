#!/bin/bash

sudo apt-get update
sudo apt install python3
python3 --version
echo 'alias python="python3"' >>~/.bash_aliases
