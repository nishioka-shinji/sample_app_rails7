# sample_app_rails7
![](https://img.shields.io/badge/rails-7.0.8-red.svg)
![](https://img.shields.io/badge/ruby-3.2.2-orange.svg)
![](https://img.shields.io/badge/mysql-8.2.0-blue.svg)
![](https://img.shields.io/badge/nginx-1.25.3-green.svg)

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
## localstack
### SQS作成
```
awslocal sqs create-queue --queue-name my-queue
```
### Lambda関数コード作成
あらかじめ作成してzip化しておく
```
zip function.zip lambda_function.py
```
### Lambda作成
```
awslocal lambda create-function \
    --function-name my-function \
    --runtime python3.8 \
    --role arn:aws:iam::123456789012:role/lambda-role \
    --handler lambda_function.lambda_handler \
    --zip-file fileb://~/develop/sample_app_rails7/serverless/function.zip
```
### Lambda更新
```
awslocal lambda update-function-code \
    --function-name my-function \
    --zip-file fileb://~/develop/sample_app_rails7/serverless/function.zip
```
### Lambda と SQS の統合
```
awslocal lambda create-event-source-mapping \
    --function-name my-function \
    --event-source-arn arn:aws:sqs:us-east-1:000000000000:my-queue
```
### ログ
SQSはlocalstackコンテナ
Lambdaは実行時に新たにコンテナが作成されるので、そこから確認できる
