
# gitbook
gitリポジトリをドキュンメント化するサーバを構築します。
このサーバは、複数のリポジトリを管理することはできず、単一のリポジトリをドキュメント化します。
編集機能はありません。

# 利用サンプル
```
# htmlを作成
sudo gitbook serve playbooks/gitbook/documentation

# pdfを作成
sudo gitbook pdf playbooks/gitbook/documentation sample.pdf

# htmlの公開サーバを起動
sudo gitbook serve playbooks/gitbook/documentation
curl http://localhost:4000
```


# 執筆環境構築参考
https://www.gensobunya.net/portfolio/md2doujin/

