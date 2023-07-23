sudo apt-get install -y golang

echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc
if [ -e ~/.zshrc ]; then
    echo 'PATH=$PATH:~/go/bin' >> ~/.zshrc
fi
