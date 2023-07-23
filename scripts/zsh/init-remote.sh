#!/bin/bash

sudo apt-get update

# install zsh
sudo su - $1 -c "sudo apt-get install -y zsh"

# install oh-my-zsh
sudo su - $1 -c "wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
sudo su - $1 -c "echo \n | sh install.sh"

ZSH_HOME=/home/$1

# add symbolic link
sudo ln -s $ZSH_HOME/.oh-my-zsh ~/.oh-my-zsh
sudo ln -s $ZSH_HOME/.zshrc ~/.zshrc

# change default shell
sudo chsh -s /bin/zsh $1
sudo chsh -s /bin/zsh root

# install powerlevel10k
cd $(dirname $0)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo cp conf/.zshrc $ZSH_HOME/.zshrc
sudo cp conf/.p10k.zsh $ZSH_HOME/.p10k.zsh

# copy .p10k.zsh to root home directory
sudo cp $ZSH_HOME/.p10k.zsh ~/.p10k.zsh
