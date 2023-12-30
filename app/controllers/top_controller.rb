class TopController < ApplicationController
  def show
    sqs = SqsService.new
    msg = {
      key: Time.zone.now.to_i.to_s,
      value: "こんにちは"
    }.to_json

    sqs.send_message(
      "http://localstack:4566/000000000000/my-queue",
      msg
    )
  end
end
