sudo swapoff -a
sudo sed -i 's/\/swap.img/#\0/' /etc/fstab

sudo sed -i "s/#\$nrconf{restart}.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
