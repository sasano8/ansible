
```
# リポジトリ情報の登録
sudo cp cassandra.repo /etc/yum.repos.d/cassandra.repo

# instalation cassandra
sudo yum -y install cassandra
sudo systemctl daemon-reload
sudo systemctl start cassandra
```
