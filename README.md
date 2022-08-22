# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第6版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方（ローカルで動かしてみる際の手順）

手順１．リポジトリをクローンする＆bundle install

```
$ gem install bundler -v 2.2.17
$ bundle config set --local without 'production'
$ bundle install
```

手順２．データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

手順３．テストを実行して動作確認

```
$ rails test
```

手順４．サーバーを立ち上げる

```
$ rails server
```