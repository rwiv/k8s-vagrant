#!/bin/bash

cd $(dirname $0)

sudi apt-get update
sudo apt-get install -y exa
sudo apt-get install -y fzf
sudo apt-get install -y ripgrep

sudo apt-get install -y bat
sudo apt-get install -y fd-find

echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
sudo apt-get update

sudo apt-get install -y duf
sudo apt-get install -y broot
sudo apt-get install -y btop


rcs=( ~/.bashrc ~/.zshrc )

if [ ! -e ~/.local/bin ]; then
    mkdir -p ~/errors
    echo "not found ~/.local/bin" | tee -a ~/errors/`date -I`
    exit 1
fi

if [ -e /usr/bin/batcat ]; then
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi
if [ -e /usr/bin/fdfind ]; then
    ln -s /usr/bin/fdfind ~/.local/bin/fd
fi

for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo "alias l='exa -F'" | sudo tee -a $rc > /dev/null
        echo "alias ll='exa -alF'" | sudo tee -a $rc > /dev/null
        echo "alias lp='exa -lF'" | sudo tee -a $rc > /dev/null
        echo "alias br='broot'" | sudo tee -a $rc > /dev/null
    fi
done
