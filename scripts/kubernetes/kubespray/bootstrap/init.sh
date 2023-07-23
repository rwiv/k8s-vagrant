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

sudo apt-get update
sudo apt-get install -y python3-pip

git clone https://github.com/kubernetes-sigs/kubespray.git

cd kubespray

pip install -r requirements.txt

ssh-keygen -t rsa
for (( i=0; i<${#addresses[@]}; i++ )); do
    ssh-copy-id ${username}@${addresses[i]}
done

sudo cp -rfp inventory/sample inventory/mycluster

declare -a IPS=${addresses[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

cd ..
if [ -n "$3" ]; then
    sudo cp $3 kubespray/inventory/mycluster/hosts.yaml
else
    sudo cp hosts.yaml kubespray/inventory/mycluster/hosts.yaml
fi
