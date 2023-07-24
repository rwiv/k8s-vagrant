#!/bin/bash

cd $(dirname $0)

addrf=
if [ -n "$1" ]; then
    addrf=$1
else
    addrf=addresses.txt
fi

readarray -t addresses < <(cat $addrf | sed 's/[\r\n]//g' | sed '/^\s*$/d')

username=
if [ -n "$2" ]; then
    username=$2
else
    username=vagrant
fi

cd kubespray

ssh-keygen -t rsa
for (( i=0; i<${#addresses[@]}; i++ )); do
    ssh-copy-id ${username}@${addresses[i]}
done

cp -rfp inventory/sample inventory/mycluster

declare -a IPS=${addresses[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

cd ..
if [ -e hosts.yaml ]; then
    cp hosts.yaml kubespray/inventory/mycluster/hosts.yaml
fi
if [ -e addons.yml ]; then
    cp addons.yml kubespray/inventory/mycluster/group_vars/k8s_cluster/addons.yml
fi
