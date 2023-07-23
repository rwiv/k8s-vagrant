#!/bin/bash

home=
if [ -n "$1" ]; then
    home=$1
else
    home=$HOME
fi

sudo apt-get install -y golang

echo 'PATH=$PATH:~/go/bin' >> $home/.bashrc
if [ -e ~/.zshrc ]; then
    echo 'PATH=$PATH:~/go/bin' >> $home/.zshrc
fi
