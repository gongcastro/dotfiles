#!/bin/bash

echo "Installing Stan..."
# cmdstan
g++ --version
make --version
git clone https://github.com/stan-dev/cmdstan.git $HOME/.cmdstan --recursive
cd $HOME/.cmdstan
make build
make examples/bernoulli/bernoulli
./examples/bernoulli/bernoulli sample data file=examples/bernoulli/bernoulli.data.json
ls -l output.csv
# update
sudo apt-get update
