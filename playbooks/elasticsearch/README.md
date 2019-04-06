
# はじめに
elasticsearchおよびにkibanaをdockerで構築する。
dockerおよびにdocker-composeの操作方法などは以下を参照とする。

- [docker](https://github.com/sasano8/docker)

# メンテナンス

```
# コンテナへの入りた方
sudo docker exec -it kibana_kibana_1 bash
sudo docker exec -it kibana_elasticsearch_1 bash

# ログの確認
sudo docker logs kibana_kibana_1
sudo docker logs kibana_elasticsearch_1
```



