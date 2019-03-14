sudo cp cassandra.repo /etc/yum.repos.d/cassandra.repo
sudo yum -y install cassandra
sudo systemctl daemon-reload
sudo systemctl start cassandra
