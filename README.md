# sample_app_rails7
![](https://img.shields.io/badge/rails-7.0.8-red.svg)
![](https://img.shields.io/badge/ruby-3.2.2-orange.svg)
![](https://img.shields.io/badge/mysql-8.1.0-blue.svg)
![](https://img.shields.io/badge/nginx-1.25.2-green.svg)

## こちらを参考に構築
https://qiita.com/croquette0212/items/7b99d9339fd773ddf20b
### rails on docker構築手順概要
1. 設定ファイルの準備
2. Railsプロジェクトの作成
```
docker compose run rails_app rails new . --force --no-deps --database=mysql
```
3. DB接続設定
4. DB作成
```
docker compose run --rm rails_app rails db:create
```
5. イメージの起動
```
docker compose up
```
### 構築時遭遇したトラブル
[docディレクトリにメモあり](/doc)
### ECRプッシュ時の注意点
公式手順に準ずるが、ビルドは注意が必要
- m1 macの場合プラットフォームを指定`--platform=linux/amd64`
- ファイル名を指定`-f docker/nginx/Dockerfile`
```
docker build --platform=linux/amd64 -f docker/nginx/Dockerfile -t sample_app_rails_7/nginx .
docker build --platform=linux/amd64 -f docker/rails/Dockerfile -t sample_app_rails_7/rails .
```
