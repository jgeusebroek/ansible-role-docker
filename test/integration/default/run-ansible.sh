set -x
set -e # fail on error
cd /vagrant
bash install-ansible.sh # install ansible first
ansible-playbook /vagrant/install-ansible.sh
