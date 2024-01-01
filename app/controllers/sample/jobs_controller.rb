class Sample::JobsController < ApplicationController
  def index
    sqs = SqsService.new
    a = sqs.receive_messages("http://localstack:4566/000000000000/my-queue", 10, 1)
    b = sqs.receive_messages("http://localstack:4566/000000000000/my-queue2", 10, 1)
    render plain: "#{a}\n\n#{b}"
  end

  def create
    # Lambda用のキュー
    sqs = SqsService.new
    msg = {
      key: Time.zone.now.to_i.to_s,
      value: "こんにちは"
    }.to_json

    sqs.send_message(
      "http://localstack:4566/000000000000/my-queue",
      msg
    )

    # actuve_job用のキュー
    SampleJob.perform_later(Time.zone.now)
    redirect_to root_path
  end
end