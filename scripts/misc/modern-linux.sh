#!/bin/bash

cd $(dirname $0)

home=
if [ -n "$1" ]; then
    home=$1
else
    home=$HOME
fi

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


if [ ! -e ~/.local/bin ]; then
    mkdir -p $home/.local/bin
    echo 'PATH=$PATH:~/.local/bin' >> $home/.bashrc
    if [ -e ~/.zshrc ]; then
        echo 'PATH=$PATH:~/.local/bin' >> $home/.zshrc
    fi
fi

if [ -e /usr/bin/batcat ]; then
    ln -s /usr/bin/batcat $home/.local/bin/bat
fi
if [ -e /usr/bin/fdfind ]; then
    ln -s /usr/bin/fdfind $home/.local/bin/fd
fi


rcs=( "$home/.bashrc" "$home/.zshrc" )
for rc in ${rcs[@]}; do
    echo "alias l='exa -F'" >> $rc
    echo "alias ll='exa -alF'" >> $rc
    echo "alias lp='exa -lF'" >> $rc
    echo "alias br='broot'" >> $rc
done
