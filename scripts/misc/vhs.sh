#!/bin/bash

sudo apt-get upadte

# install ffmpeg
sudo apt-get install -y ffmpeg

# install ttyd
sudo snap install ttyd --classic

# install vhs
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt-get update
sudo apt-get install -y vhs
