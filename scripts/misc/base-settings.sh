# disable needrestart popup
sudo sed -i "s/#\$nrconf{restart}.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
