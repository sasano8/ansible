# subversion
subversion（バージョン管理）のインストール手順。

# 注意
SSLの導入は手順に含んでいないので、パブリックな場所では利用しない。
もしくは、SSL導入などセキュリティを設ける。
SE LINUXを無効化しているので注意する。
匿名でリポジトリを編集可能なため、ユーザ認証などを設けること。

# 使用ポート

- 3690(svnプロトコル)

# 使用ディレクトリ
/var/svn/my_project

# サーバ構築後の接続確認
```
svn list file:///var/svn/repos -v
svn list svn://localhost/repos -v
```

