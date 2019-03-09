
# gitbook
gitリポジトリをドキュンメント化するサーバを構築します。
このサーバは、複数のリポジトリを管理することはできず、単一のリポジトリをドキュメント化します。
編集機能はありません。

# サーバの起動
```
# gitのリポジトリを指定します。（このケースでは、サンプルのリポジトリをgitbookにしています。）
sudo gitbook serve playbooks/gitbook/documentation
curl http://localhost:4000
```
