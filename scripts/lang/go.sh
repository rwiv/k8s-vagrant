#!/bin/bash

sudo apt-get install -y golang

rcs=( ~/.bashrc ~/.zshrc )
for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo "PATH=\$PATH:$HOME/go/bin" | sudo tee -a $rc > /dev/null
    fi
done
