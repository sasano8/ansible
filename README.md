# ansible

# getting started

```
# install epel(Extra Packages for Enterprise Linux) 
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install ansible
sudo yum install --enablerepo=epel -y ansible

# test ping
ansible all -i hosts -m ping

```


# enjoy execute playbook
```
ansible-playbook playbook.yml -i hosts

```
