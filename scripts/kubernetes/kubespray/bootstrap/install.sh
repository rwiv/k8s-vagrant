#!/bin/bash

cd $(dirname $0)

sudo apt-get update
sudo apt-get install -y python3-pip

git clone https://github.com/kubernetes-sigs/kubespray.git

cd kubespray

pip install -r requirements.txt
