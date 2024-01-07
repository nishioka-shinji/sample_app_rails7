class ErrorJob < ApplicationJob
  # NORE: 意図的にエラーを発生させるコード
  #       エラー発生時はSQSキューに設定しているmaxReceiveCountの回数分、retryが実行される
  #       エラー発生時はキューは削除されず、残り続ける。
  #       https://github.com/aws/aws-sdk-rails/blob/e3083d98b40333b0c87e080d1d1ba8924306b4df/lib/aws/rails/sqs_active_job/executor.rb#L24-L40
  #       そのため、処理が成功せずmaxReceiveCountの回数を超えたキューはSQS側の設定でDeadLetterQueueに移動する
  def perform(*a)
    puts "=========="
    puts "ErrorJobを実行"
    puts a
    puts "=========="
    raise
  end
end
