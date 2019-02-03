# subversion
subversion（バージョン管理）のインストール手順。

# 注意
SSLの導入は手順に含んでいないので、セキュアな要件がある場合は利用しない。
SE LINUXを無効化しているので注意する。


# 使用ポート

- 3690(svnプロトコル)

# 使用ディレクトリ
/var/svn/repos

# サーバ構築後の接続確認
```
svn list file:///var/svn/repos -v
svn list svn://localhost/repos -v
```

