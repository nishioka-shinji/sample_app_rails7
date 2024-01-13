class Sample::JobsController < ApplicationController
  def index
    sqs = SqsService.new
    a = sqs.receive_messages("http://localstack:4566/000000000000/sample_app_rails7_sqs_dlq", 10, 1)
    b = sqs.receive_messages("http://localstack:4566/000000000000/sample_app_rails7_sqs", 10, 1)
    render plain: "#{a}\n\n#{b}"
  end

  def create
    # actuve_job用のキュー
    SampleJob.perform_later(Time.zone.now)
    ErrorJob.perform_later(Time.zone.now)
    redirect_to root_path
  end
end
