require 'kafka'
require 'json'

host, port = JSON.parse(ENV['KAFKA_URL'])['zk'].split(":")
producer = Kafka::Producer.new(host: host, port: port)

1000.times do |i|
  puts i
  message = Kafka::Message.new("message #{i}")
  producer.push(message)
end
