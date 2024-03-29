class SqsService
  def initialize
    @sqs = Aws::SQS::Client.new(
      region: 'us-east-1',
      access_key_id: 'dummy',
      secret_access_key: 'dummy'
    )
  end

  def send_message(queue_url, message_body)
    @sqs.send_message(queue_url: queue_url, message_body: message_body)
  end

  def receive_messages(queue_url, max_number_of_messages = 10, wait_time_seconds = 20)
    @sqs.receive_message(
      queue_url: queue_url,
      max_number_of_messages: max_number_of_messages,
      wait_time_seconds: wait_time_seconds
    ).messages
  end
end
