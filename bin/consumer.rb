require 'poseidon'
require 'json'

host, port = JSON.parse(ENV["KAFKA_URL"])["kafka"].split(":")
consumer = Poseidon::PartitionConsumer.new("consumer", host, port,
                                            "demoday", 0, :earliest_offset)

loop do
  messages = consumer.fetch
  messages.each do |m|
    m.value
  end
end
