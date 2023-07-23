if [ -e ~/.zshrc ]; then
    echo "alias k='kubectl'" >> ~/.zshrc
fi

if [ -e ~/.bashrc ]; then
    echo "alias k='kubectl'" >> ~/.bashrc
fi
