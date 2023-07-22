#!/usr/bin/zsh

cd $(dirname $0)

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ./conf/.zshrc ~/.zshrc
cp ./conf/.p10k.zsh ~/.p10k.zsh
