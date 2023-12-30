class SqsService
  def initialize
    @sqs = Aws::SQS::Client.new(
      region: Rails.application.credentials.aws[:region],
      access_key_id: Rails.application.credentials.aws[:access_key_id],
      secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    )
  end

  def send_message(queue_url, message_body)
    @sqs.send_message(queue_url: queue_url, message_body: message_body)
  end
end
