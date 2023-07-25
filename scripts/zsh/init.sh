#!/bin/bash

sudo apt-get update

# install zsh
sudo apt-get install -y zsh

# install oh-my-zsh
echo \n | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add symbolic link
sudo ln -s ~/.oh-my-zsh /root/.oh-my-zsh
sudo ln -s ~/.zshrc /root/.zshrc

# change default shell
sudo chsh -s /bin/zsh $LOGNAME
sudo chsh -s /bin/zsh root

# install powerlevel10k
cd $(dirname $0)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp conf/.zshrc ~/.zshrc
cp conf/.p10k.zsh ~/.p10k.zsh

# copy .p10k.zsh to root home directory
sudo ln -s ~/.p10k.zsh /root/.p10k.zsh
