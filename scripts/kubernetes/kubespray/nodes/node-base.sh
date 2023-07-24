#!/bin/bash

sudo swapoff -a
sudo sed -i 's/\/swap.img/#\0/' /etc/fstab

sudo sed -i "s/#\$nrconf{restart}.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
