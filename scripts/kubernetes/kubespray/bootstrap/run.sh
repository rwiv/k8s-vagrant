cd $(dirname $0)
cd kubespray

ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml
