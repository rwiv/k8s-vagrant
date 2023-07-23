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
    mkdir -p ~/.local/bin
    echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
    if [ -e ~/.zshrc ]; then
        echo 'PATH=$PATH:~/.local/bin' >> ~/.zshrc
    fi
fi


if [ -e /usr/bin/batcat ]; then
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi
if [ -e /usr/bin/fdfind ]; then
    ln -s /usr/bin/fdfind ~/.local/bin/fd
fi


if [ -e ~/.zshrc ]; then
    echo "alias l='exa -F'" >> ~/.zshrc
    echo "alias ll='exa -alF'" >> ~/.zshrc
    echo "alias lp='exa -lF'" >> ~/.zshrc
    echo "alias br='broot'" >> ~/.zshrc
fi

if [ -e ~/.bashrc ]; then
    echo "alias l='exa -F'" >> ~/.bashrc
    echo "alias ll='exa -alF'" >> ~/.bashrc
    echo "alias lp='exa -lF'" >> ~/.bashrc
    echo "alias br='broot'" >> ~/.bashrc
fi

