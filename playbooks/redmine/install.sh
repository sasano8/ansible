# instalation redmine
かなり適当。
apacheでの起動確認ができなかった。
根本的に要検証。


```
# requirement
sudo yum install -y git # ruby-buildのダウンロードで利用
sudo yum install bzip2 # rbenv install で利用

# install apache
sudo yum install -y httpd
sudo systemctl enable httpd.service


# mariadbとmysqlが競合するためmariadbを削除
sudo yum remove mariadb-libs
sudo rm -rf /var/lib/mysql/


# install mysql
sudo yum localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
sudo yum install mysql mysql-server mysql-devel
sudo systemctl enable mysqld.service
sudo systemctl start mysqld.service


# initialize mysql
# 通常はmysql_secure_installationを使用するが、
# 自動化の障害となるので利用しない。（mysql_secure_installation同等のことをした方がよい）
# /var/log/mysqld.log | grep password で初期パスワードを確認
sudo mysqld --initialize-insecure --user=mysql

# create database for redmine
CREATE DATABASE redmine charset="utf8";
GRANT ALL PRIVILEGES ON redmine.* TO redmine@localhost IDENTIFIED BY 'PASS_h@f0s';

# install redmine
sudo git clone git://github.com/sstephenson/rbenv.git

# なぜか権限がないので書き込み権限を無理やり付与（セキュリティ低下！！注意！！！）
sudo chmod 666 /etc/profile
echo 'export RBENV_ROOT="/opt/rbenv"' >> /etc/profile
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile
sudo mkdir /opt/rbenv/plugins
sudo git clone git://github.com/sstephenson/ruby-build.git
sudo mv /opt/ruby-build /opt/rbenv/plugins

# ターミナルを切断し後続の手順を実行
# sudoだと/etc/profileが読み込まれない
sudo yum install -y gcc make openssl-devel readline-devel
sudo -i rbenv install 2.3.3 # rubyをインストールする
sudo -i rbenv global 2.3.3 # システム全体で利用するrubyバージョンを指定する

#
sudo -i gem install passenger
sudo yum install -y gcc gcc-c++ libcurl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel ImageMagick ImageMagick-devel

# シャットダウン

#
sudo -i passenger-install-apache2-module

# 
sudo yum install ipa-pgothic-fonts # redmineで利用するフォント
sudo -i gem install bundle

# install redmine
sudo git clone -b 4.0.0 https://github.com/redmine/redmine.git
sudo mv redmine /opt/

cat <<EOF | sudo tee /opt/redmine/config/database.yml
production:
  adapter: mysql2
  database: redmine
  host: localhost
  username: redmine
  password: PASS_h@f0s
  encoding: utf8
EOF

cat <<EOF | sudo tee /opt/redmine/config/configuration.yml 
production:
  email_delivery:
    delivery_method: :smtp
    smtp_settings:
      address: "localhost"
      port: 25
      domain: 'myhost.com'

  rmagick_font_path: /usr/share/fonts/ipa-pgothic/ipagp.ttf
EOF

cd /opt/redmine

# ライブラリ同士の依存性などを管理・導入を行うツール
# sudoは非推奨・・・
sudo chmod 777 /opt/redmine
bundle install --without development test

# imagemagickがインストールされていないなら、とりあえず無視。
bundle install --without development test rmagick

# 権限がいけないので全権限付与（危険！！）
sudo chmod -R 777 /opt/redmine
bundle exec rake generate_secret_token


# apachが実行するのでapacheにユーザ変更
chown -R apache:apache /opt/redmine



yum groupinstall "Development Tools"



cat <<EOF | sudo tee -a /etc/httpd/conf/httpd.conf 
LoadModule passenger_module /opt/rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/passenger-5.0.22/buildout/apache2/mod_passenger.so
PassengerRoot /opt/rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/passenger-5.0.22
PassengerDefaultRuby /opt/rbenv/versions/2.2.3/bin/ruby
<VirtualHost *:80>
    ServerName myhost.com
    DocumentRoot /opt/redmine-3.2.0/public
    <Directory /opt/redmine-3.2.0/public>
        AllowOverride all
        Options -MultiViews
    </Directory>
</VirtualHost>
EOF


# 検証用　ちゃんとapacheでやること
bundle exec rails server webrick -e production

# sudo ln -s /opt/redmine/public /var/www/html


```


# rbenv
rubyのインストールおよびにインストールしたrubyのバージョンを管理・切り替えを行うツール
