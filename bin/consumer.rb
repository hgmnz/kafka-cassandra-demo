require 'poseidon'
require 'json'

host, port = JSON.parse(ENV["KAFKA_URL"])["kafka"].split(":")
consumer = Poseidon::PartitionConsumer.new("consumer", host, port,
                                            "demoday", 0, :earliest_offset)

i = 0

loop do
  messages = consumer.fetch
  puts "#{Time.now}: received #{i} messages" if (i % 100000 == 0)
  messages.each do |m|
    m.value
    i = i + 1
  end
end
