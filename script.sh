##!/bin/bash
#git clone https://github.com/kubernetes-sigs/kubespray.git
#
#cd kubespray
#
#sudo pip install -r requirements.txt
#
## Copy ``inventory/sample`` as ``inventory/mycluster``
#cp -rfp inventory/sample inventory/mycluster
#
## Update Ansible inventory file with inventory builder
#declare -a IPS=(192.168.84.228)
#CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
#
## Review and change parameters under ``inventory/mycluster/group_vars``
##cat inventory/mycluster/group_vars/all/all.yml
##cat inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
#
## Deploy Kubespray with Ansible Playbook - run the playbook as root
## The option `--become` is required, as for example writing SSL keys in /etc/,
## installing packages and interacting with various systemd daemons.
## Without --become the playbook will fail to run!
#ansible-playbook -e ansible_ssh_port=2223 -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml
#!/bin/bash
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
sudo pip install -r requirements.txt
# Copy ``inventory/sample`` as ``inventory/mycluster``
cp -rfp inventory/sample inventory/mycluster
# Update Ansible inventory file with inventory builder
declare -a IPS=(192.168.88.248:2223)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
# Review and change parameters under ``inventory/mycluster/group_vars``
#cat inventory/mycluster/group_vars/all/all.yml
#cat inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
# Deploy Kubespray with Ansible Playbook - run the playbook as root
# The option `--become` is required, as for example writing SSL keys in /etc/,
# installing packages and interacting with various systemd daemons.
# Without --become the playbook will fail to run!
ansible-playbook -u ubuntu -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml