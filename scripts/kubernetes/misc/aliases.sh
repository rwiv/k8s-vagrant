#!/bin/bash
rcs=( ~/.bashrc ~/.zshrc )
for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo "alias k='kubectl'" | sudo tee -a $rc > /dev/null
    fi
done
