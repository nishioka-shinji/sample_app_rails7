import json
import logging

# ロガーの設定
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # SQSメッセージを処理
    for record in event['Records']:
        # メッセージの本文を取得
        message_body = record['body']
        logger.info(f"Received message: {message_body}")

    print('==================')
    print(context)
    print('==================')

    return {
        'statusCode': 200,
        'body': json.dumps('Message processed successfully.')
    }
