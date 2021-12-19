## Getting Started

``` sh
# DB等のDockerコンテナを起動する
make
# 初期設定を行う、初回のみでOK
bin/setup
# シードデータの作成、初回のみでOK
bundle exec rails db:seed
# Railsサーバの起動
make s
=> http://lvh.me:3000
```

アプリのURL
https://tweet-application.herokuapp.com/login
