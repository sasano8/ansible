# ansible

This project is uncompleted.

# issue
- Can not register service(systemd).

# getting started

```
# move to work folder
var_work_folder="$HOME"
cd $var_work_folder

# install git
sudo yum install -y git

# install epel(Extra Packages for Enterprise Linux) 
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install ansible
sudo yum install --enablerepo=epel -y ansible

# git clone this project
git clone https://github.com/sasano8/ansible.git

# change current directory
cd ansible/

# test ping
ansible all -i hosts -m ping

```


# execute playbook
```
ansible-playbook $HOME/ansible/playbooks/subversion/playbook.yml -i $HOME/ansible/hosts
```
