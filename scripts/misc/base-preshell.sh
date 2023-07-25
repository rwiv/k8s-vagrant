# disable needrestart popup
sudo sed -i "s/#\$nrconf{restart}.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

# add error directory
if [ ! -e ~/errors ]; then
    mkdir ~/errors
fi
