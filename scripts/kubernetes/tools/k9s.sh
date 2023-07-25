#!/bin/bash

if [ ! -e ~/.local/bin ]; then
    mkdir -p ~/errors
    echo "not found ~/.local/bin" | tee "~/errors/`date -I`"
    exit 1
fi

mkdir /tmp/k9s
curl -fsSL https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz -o /tmp/k9s/k9s.tar.gz
tar -zxvf /tmp/k9s/k9s.tar.gz -C /tmp/k9s
mv /tmp/k9s/k9s ~/.local/bin
rm -rf /tmp/k9s
