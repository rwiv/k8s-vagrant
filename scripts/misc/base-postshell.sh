#!/bin/bash

rcs=( ~/.bashrc ~/.zshrc )

# set ~/.local/bin
if [ ! -e ~/.local/bin ]; then
    mkdir -p ~/.local/bin
fi

for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo "PATH=\$PATH:$HOME/.local/bin" | sudo tee -a $rc > /dev/null
    fi
done

# set aliases
for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo "alias vi='vim'" | sudo tee -a $rc > /dev/null
    fi
done
