# sample_app_rails7
![](https://img.shields.io/badge/rails-7.0.3-red.svg)
![](https://img.shields.io/badge/ruby-3.1.2-orange.svg)
![](https://img.shields.io/badge/mysql-8.0.29-blue.svg)

## こちらを参考に構築
https://qiita.com/croquette0212/items/7b99d9339fd773ddf20b
### 構築手順概要
1. 設定ファイルの準備
2. Railsプロジェクトの作成
```
docker-compose run web rails new . --force --no-deps --database=mysql
```
3. DB接続設定
4. DB作成
```
docker-compose run web rails db:create
```
5. イメージの起動
```
docker-compose up
```
### 構築時遭遇したトラブル
[docディレクトリにメモあり](/doc)
