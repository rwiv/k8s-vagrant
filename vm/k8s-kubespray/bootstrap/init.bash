addresses=(192.168.0.80 192.168.0.81)
username=vagrant

sudo apt-get update
sudo apt-get install -y python3-pip

git clone https://github.com/kubernetes-sigs/kubespray.git

cd kubespray
pip install -r requirements.txt
# sudo systemctl daemon-reload


ssh-keygen -t rsa
for (( i=0; i<${#addresses[@]}; i++ )); do
    ssh-copy-id ${username}@${addresses[i]}
done


cp -rfp inventory/sample inventory/mycluster

declare -a IPS=${addresses[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

# ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml
