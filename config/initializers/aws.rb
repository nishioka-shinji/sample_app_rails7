Aws::Rails::SqsActiveJob.configure do |config|
  config.queues = { default: "http://localstack:4566/000000000000/my-queue2" }
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.max_messages = 5
  config.client = Aws::SQS::Client.new(region: 'us-east-1')
end