#!/bin/bash

# SQS + Lambda
awslocal sqs create-queue --queue-name sample_app_rails7_sqs_dlq
awslocal lambda create-function \
    --function-name my-function \
    --runtime python3.8 \
    --role arn:aws:iam::123456789012:role/lambda-role \
    --handler lambda_function.lambda_handler \
    --zip-file fileb:///opt/code/localstack/lambda_functions/sample-app-rails7-project.zip
awslocal lambda create-event-source-mapping \
    --function-name my-function \
    --event-source-arn arn:aws:sqs:us-east-1:000000000000:sample_app_rails7_sqs_dlq

# SQS + ActiveJob
awslocal sqs create-queue --queue-name sample_app_rails7_sqs