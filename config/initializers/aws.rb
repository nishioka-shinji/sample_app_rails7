Aws::Rails::SqsActiveJob.configure do |config|
  config.queues = { default: "http://localstack:4566/000000000000/sample_app_rails7_sqs" }
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.max_messages = 5
  config.client = Aws::SQS::Client.new(
    region: 'us-east-1',
    access_key_id: 'dummy',
    secret_access_key: 'dummy'
  )
end
