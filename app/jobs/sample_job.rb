class SampleJob < ApplicationJob
  def perform(*a)
    puts "=========="
    puts "SampleJobを実行"
    puts a
    puts "=========="
  end
end
