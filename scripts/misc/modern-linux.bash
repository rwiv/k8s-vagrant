sudo apt-get install -y bat
sudo apt-get install -y exa
sudo apt-get install -y fzf
sudo apt-get install -y fd-find
sudo apt-get install -y ripgrep

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s /usr/bin/fdfind ~/.local/bin/fd
