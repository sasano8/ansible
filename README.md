# ansible

# getting started

```
# install ansible
sudo yum install --enablerepo=epel -y ansible

# test ping.
ansible all -i hosts -m ping

# enjoy execute playbook.
ansible-playbook playbook.yml -i hosts

```
