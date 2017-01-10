set -x
set -e # fail on error

# install ansible first
cd /vagrant
bash install-ansible.sh 

# Run test playbook
cd /home/vagrant/ansible-role-docker/test/integration/default/
ansible-playbook default.yml